# [gitlab](https://github.com/chaiyd/docker/tree/master/gitlab)

## 常见问题
- gitlab 重置密码
  ```
  gitlab-rails console -e production
  
  user = User.where(id:1).first
  user.password=12345678
  user.password_confirmation=12345678
  user.save!
  ```

- gitlab 导入
  - https://docs.gitlab.com/ee/raketasks/import.html
  ```
   sudo chown -R git:git /var/opt/gitlab/git-data/repository-import-$(date "+%Y-%m-%d")
   sudo gitlab-rake gitlab:import:repos["/var/opt/gitlab/git-data/repository-import-$(date "+%Y-%m-%d")"]
   
  ```

- gitlab备份
  `gitlab-rake gitlab:backup:create`
  
- git 
  - 删除远程tag
  ```
   git tag -d tag_name
   git push origin :refs/tags/tag_name
  ```
  - 删除远程分支
  ```
   git push origin :branch_name
  ```

- 处理git仓库臃肿
  - 找出git中最大的文件
   ```
    git verify-pack -v .git/objects/pack/pack-*.idx | sort -k 3 -g | tail -5
   ```
  - 根据id找对应的文件名
   ```
    git rev-list --objects --all | grep ${id}
   ``` 
  - 删除文件
   ```
    git filter-branch --force --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch  ${file_path/file} ' --tag-name-filter cat -- --all
   ```
  - 执行完后，提交
   ```
    git push --force --all

   ```
 
## gitlab
- https://gitlab.com/
- openldap、email
- 解决使用外部nginx ssl clone等跳转问题
