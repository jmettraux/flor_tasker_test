
class EmailTasker < Flor::BasicTasker

  def task

    p [ '=' * 35, Time.now, 'sending email!' ]

    reply
  end
end

