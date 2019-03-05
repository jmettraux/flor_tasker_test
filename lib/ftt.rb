
$: << File.dirname(__FILE__)

require 'flor/unit'

require 'ftt/taskers/email'


FLOR = Flor::Unit.new('flor/etc/conf.json')
  # Configuration is all there
  # It points DB to flor/var/flor.db
  # Binds this flor unit instances behind the `FLOR` name

FLOR.storage.delete_tables
FLOR.storage.migrate
  # Prepare fresh database

FLOR.start
  # Start the flor unit
  # That starts a thread ticking for messages (launch messages, tasker replies,
  # etc)

exid =
  FLOR.launch(
    %q{
      email 'send application form'
    },
    domain: 'org.example')

pp exid

p [ '-' * 40, Time.now, 'entering sleep...' ]
sleep 5
p [ '-' * 40, Time.now, 'sleep over' ]

