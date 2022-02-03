#!/bin/bash

git remote add -f snitsig-pingvin-apigee git@github.com:gsjurseth/snitsig-pingvin-apigee
git remote add -f snitsig-pingvin-cart git@github.com:gsjurseth/snitsig-pingvin-cart
git remote add -f snitsig-pingvin-gql git@github.com:gsjurseth/snitsig-pingvin-gql
git remote add -f snitsig-pingvin-masterdata git@github.com:gsjurseth/snitsig-pingvin-masterdata
git remote add -f snitsig-pingvin-mongodb git@github.com:gsjurseth/snitsig-pingvin-mongodb
git remote add -f snitsig-pingvin-org git@github.com:gsjurseth/snitsig-pingvin-org
git remote add -f snitsig-pingvin-price git@github.com:gsjurseth/snitsig-pingvin-price
git remote add -f snitsig-pingvin-warehouse git@github.com:gsjurseth/snitsig-pingvin-warehouse

git subtree add --prefix snitsig-pingvin-apigee snitsig-pingvin-apigee main --squash
git subtree add --prefix snitsig-pingvin-cart snitsig-pingvin-cart main --squash
git subtree add --prefix snitsig-pingvin-gql snitsig-pingvin-gql main --squash
git subtree add --prefix snitsig-pingvin-masterdata snitsig-pingvin-masterdata main --squash
git subtree add --prefix snitsig-pingvin-mongodb snitsig-pingvin-mongodb main --squash
git subtree add --prefix snitsig-pingvin-org snitsig-pingvin-org main --squash
git subtree add --prefix snitsig-pingvin-price snitsig-pingvin-price main --squash
git subtree add --prefix snitsig-pingvin-warehouse snitsig-pingvin-warehouse main --squash
