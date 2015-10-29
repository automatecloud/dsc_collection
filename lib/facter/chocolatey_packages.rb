Facter.add(:chocolatey_packages) do
  confine :kernel => 'windows'
  setcode do
    Facter::Core::Execution.exec('choco list -lo')
  end
end
