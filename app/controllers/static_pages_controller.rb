class StaticPagesController < ApplicationController
  def home
    logger.info 'yeayeyay'

    PracticeJob.perform_later
  end

  def help
  end

  def about
  end

  def contact
  end
end
