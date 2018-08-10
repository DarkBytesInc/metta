enroll_secret="yoursecrethere"

platform=RUBY_PLATFORM
Vagrant.configure("2") do |config|
  config.vm.define "windows-vagrant" do |config|
    config.vm.box = "StefanScherer/windows_10"
    # config.vm.provision "shell", path: "https://s3-us-west-2.amazonaws.com/darkbytes-binaries/installers/get_latest_windows_dbhs.ps1"
    config.vm.provision "shell" do |s|
      s.inline = '$secret="'#{enroll_secret}'" ; $WebClient = New-Object System.Net.WebClient ; $WebClient.DownloadFile("https://s3-us-west-2.amazonaws.com/darkbytes-binaries/installers/dbhs-latest-windows-installer.exe","$env:temp\dbhs-latest-windows-installer.exe") ; Start-Process "$env:temp\dbhs-latest-windows-installer.exe" -argument "--mode unattended --unattendedmodeui none --enrollsecret $secret" -Wait ; Remove-Item -Path "$env:temp\dbhs-latest-windows-installer.exe" -Force'
    end
  end
  config.vm.define "linux-vagrant" do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.provision "shell" do |s|
      s.inline = "/bin/bash -c \"curl -s https://s3-us-west-2.amazonaws.com/darkbytes-binaries/installers/get_latest_linux_dbhs.sh | sudo bash -s #{enroll_secret}\""
    end
  end
  if platform.include?("darwin")
    config.vm.define "osx-vagrant" do |config|
      config.vm.box = "AndrewDryga/vagrant-box-osx"
      config.vm.provision "shell" do |s|
        s.inline = "/bin/bash -c \"curl -s https://s3-us-west-2.amazonaws.com/darkbytes-binaries/installers/get_latest_macos_dbhs.sh | sudo bash -s #{enroll_secret}\""
      end
    end
  end
end
