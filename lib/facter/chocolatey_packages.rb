Facter.add(:chocolatey_packages) do
  confine :kernel => 'windows'
  setcode do
    Facter::Core::Execution.exce('choco list -lo')
  end
end
