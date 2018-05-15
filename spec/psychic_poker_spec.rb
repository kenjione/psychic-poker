RSpec.describe PsychicPoker do
  it "has a version number" do
    expect(PsychicPoker::VERSION).not_to be nil
  end

  it 'checks for straight_flush' do
    input = 'TH JH QC QD QS QH KH AH 2S 6S'
    expect(PsychicPoker.search(input)).to eq('Hand: TH JH QC QD QS Deck: QH KH AH 2S 6S Best hand: straight-flush')
  end

  it 'checks for four of a kind' do
    input = '2H 2S 3H 3S 3C 2D 3D 6C 9C TH'
    expect(PsychicPoker.search(input)).to eq('Hand: 2H 2S 3H 3S 3C Deck: 2D 3D 6C 9C TH Best hand: four-of-a-kind')
  end

  it 'checks for full_house' do
    input = '2H 2S 3H 3S 3C 2D 9C 3D 6C TH'
    expect(PsychicPoker.search(input)).to eq('Hand: 2H 2S 3H 3S 3C Deck: 2D 9C 3D 6C TH Best hand: full-house')
  end

  it 'checks for flush' do
    input = '2H AD 5H AC 7H AH 6H 9H 4H 3C'
    expect(PsychicPoker.search(input)).to eq('Hand: 2H AD 5H AC 7H Deck: AH 6H 9H 4H 3C Best hand: flush')
  end

  it 'checks for straight' do
    input = 'AC 2D 9C 3S KD 5S 4D KS AS 4C'
    expect(PsychicPoker.search(input)).to eq('Hand: AC 2D 9C 3S KD Deck: 5S 4D KS AS 4C Best hand: straight')
  end

  it 'check for three-of-a-kind' do
    input = 'KS AH 2H 3C 4H KC 2C TC 2D AS'
    expect(PsychicPoker.search(input)).to eq('Hand: KS AH 2H 3C 4H Deck: KC 2C TC 2D AS Best hand: three-of-a-kind')
  end

  it 'check for two_pairs' do
    input = 'AH 2C 9S AD 3C QH KS JS JD KD'
    expect(PsychicPoker.search(input)).to eq('Hand: AH 2C 9S AD 3C Deck: QH KS JS JD KD Best hand: two-pairs')
  end

  it 'check for one_pair' do
    input = '6C 9C 8C 2D 7C 2H TC 4C 9S AH'
    expect(PsychicPoker.search(input)).to eq('Hand: 6C 9C 8C 2D 7C Deck: 2H TC 4C 9S AH Best hand: one-pair')
  end

  it 'check for highest card' do
    input = '3D 5S 2H QD TD 6S KH 9H AD QH'
    expect(PsychicPoker.search(input)).to eq('Hand: 3D 5S 2H QD TD Deck: 6S KH 9H AD QH Best hand: highest-card')
  end
end
