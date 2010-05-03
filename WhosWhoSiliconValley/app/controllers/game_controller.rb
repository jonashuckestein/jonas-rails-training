class GameController < ApplicationController


  def new_game
    
    # clean up the session
    session[:start_time] = Time.now
    session[:penalty] = 0 # time penalty time in seconds
    session[:round] = 1
    session[:hints] = []
    
    create_question
    for i in 0..WHO_CONFIG[:NUM_HINTS]
      create_hint
    end
      
    render :action => :play
  
  end


  def hint
    
    # TODO this should also return the new penalty
    session[:penalty] = session[:penalty] + 10
    
    if session[:hints].count == 0 
      render :layout => false, :text => "No more hints! Sorry!", :status => :not_found 
    else
      render :layout => false, :text => "<li>#{session[:hints].pop}</li>"   
    end
  end

  def answer
  
    # if the answer is correct, go to the next round
    if params[:answer] == session[:answer_s]
      session[:round] = session[:round] + 1
      
      if session[:round] > WHO_CONFIG[:NUM_ROUNDS] 
        flash[:notice] = "You won the game! It took you TODO time to do so!"
        redirect_to :controller => :game, :action => :win  
      
      elsif
        flash[:notice] = "That was the correct answer! Well done!"
        
        create_question
        [0..WHO_CONFIG[:NUM_HINTS]].each do create_hint end
      
        render :action => :play
           
      end
      
      
    else
      flash[:error] = "That was not the right answer! 10 penalty seconds!"
      session[:penalty] = session[:penalty] + 10
      render :action => :play
    end
    
    # if we're in the first round, generate some questions
    session[:questions] = ["Question 1", "Question 2"]

  
  end

  def win
    
    # TODO highscore entry
    
    
    
  end

private

  def create_question
    session[:question_type] = rand(2) == 0 ? :person : :company  
    if(session[:question_type] == :person)
      session[:answer] = Person.find :first, :offset => rand(Person.count)
      session[:answer_s] = "#{session[:answer].first_name} #{session[:answer].last_name}"
    else
      session[:answer] = Company.find :first, :offset => rand(Company.count)   
      session[:answer_s] = "#{session[:answer].name}"
    end
  end


  def create_person_hint
    
    # this is a possibly endless list of hint-types
    # TODO: hints could be objects and the view would know how to construct sentences (maybe with images) of the objects
    # TODO: not the ruby way. have a list of functions for the hints or something. prevent doubles

    r = rand(2)
   
    case r
      when 0
        session[:hints] << "His first name starts with #{session[:answer].first_name[0,1]}"
      else
        session[:hints] << "His last name starts with #{session[:answer].last_name[0,1]}"
    end
      
    
  end


  def create_company_hint
    
    r = rand(2)
   
    case r
      when 0
        session[:hints] << "The company is located in #{session[:answer].location}"
      else
        session[:hints] << "It's name starts with #{session[:answer].name[0,1]}"
    end
      
    
  end

  def create_hint
    if(session[:question_type] == :person) 
      create_person_hint
    else
      create_company_hint
    end
  end
  

end
