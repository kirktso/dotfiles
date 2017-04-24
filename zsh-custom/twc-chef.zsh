# TWC Chef
export PLATFORM_CHEF="${HOME}/Developer/github/twc/platform-chef"
if [[ -d ${PLATFORM_CHEF} ]]; then
  export PATH="${PATH}:${PLATFORM_CHEF}/scripts"
  . ${PLATFORM_CHEF}/devops/zshrc.include
  chef_on sun-dev_us-east-1
  export PATH=/opt/chefdk/embedded/bin:$PATH
fi

alias env-sun-prod-us-east-1='chef_on sun-prod_us-east-1'
alias env-sun-prod-us-west-2='chef_on sun-prod_us-west-2'
alias env-sun-prod-ap-southeast-1='chef_on sun-prod_ap-southeast-1'
alias env-sun-prod-eu-west-1='chef_on sun-prod_eu-west-1'

alias env-sun-qa-east-1='chef_on sun-qa_us-east-1'
alias env-sun-qa-west-2='chef_on sun-qa_us-west-2'

alias env-sun-dev-east-1='chef_on sun-dev_us-east-1'

# alias ch-prod-us-west-1='chef_on sun-prod_us-west-1'
#alias c9qa='chef_on sun-qa_tor01'
#alias c9prod='chef_on sun-prod_tor01'

# Set Embedded Ruby by PATH
#alias chef_ruby='chruby_use /opt/chefdk/embedded'
