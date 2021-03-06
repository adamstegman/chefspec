require 'chefspec'

describe 'pacman_package::upgrade' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'upgrades a pacman_package with an explicit action' do
    expect(chef_run).to upgrade_pacman_package('explicit_action')
    expect(chef_run).to_not upgrade_pacman_package('not_explicit_action')
  end

  it 'upgrades a pacman_package with attributes' do
    expect(chef_run).to upgrade_pacman_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not upgrade_pacman_package('with_attributes').with(version: '1.2.3')
  end

  it 'upgrades a pacman_package when specifying the identity attribute' do
    expect(chef_run).to upgrade_pacman_package('identity_attribute')
  end
end
