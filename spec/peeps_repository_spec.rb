require "peeps"
require "peeps_repository"

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_table.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do
    reset_peeps_table
  end

  it "lists all peeps" do
    repo = PeepsRepository.new

    peeps_all = repo.all

    expect(peeps_all.length).to eq(4)
    expect(peeps_all.first.peep).to eq("Going to walk the dog!")
  end


end