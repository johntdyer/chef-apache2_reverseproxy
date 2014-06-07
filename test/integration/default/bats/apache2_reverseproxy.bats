#!/usr/bin/env bats

@test "test1 vhost file in sites-available" {
  result="cat /etc/apache2/sites-available/test1.conf"
  [ "$status" -eq 0 ]
}

@test "test1 vhost file in sites-enabled" {
  result="cat /etc/apache2/sites-enabled/test1.conf"
  [ "$status" -eq 0 ]
}

@test "test2 vhost file in sites-available" {
  result="cat /etc/apache2/sites-available/test1.conf"
  [ "$status" -eq 0 ]
}

@test "test2 vhost file not in sites-enabled" {
  result="cat /etc/apache2/sites-enabled/test1.conf"
  [ "$status" -eq 1 ]
}
