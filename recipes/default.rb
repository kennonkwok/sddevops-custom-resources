#
# Cookbook Name:: sddevops-custom-resources
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
mysite 'foo' do
  port 81
  action :create
end

mysite 'bar' do
  port 82
end
