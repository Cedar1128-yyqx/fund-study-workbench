# 基金从业学习工作台

面向零基础学习者的基金从业学习页面，按基础概念到实务应用组织三科内容。页面内含章节与知识点、含义解释、场景、选择题、思维导图、学习计划、进度记录和术语工具箱。

## 使用

- 将本仓库下载到本地后，打开 `index.html` 即可使用。
- 本仓库包含 GitHub Pages 工作流。首次发布时，在仓库 **Settings → Pages → Build and deployment → Source** 选择 **GitHub Actions**。
- 学习进度默认保存在当前浏览器。页面提供学习记录导出与导入功能；跨设备自动同步需要另行配置 Supabase。

## Supabase 云同步

- 项目 URL 与 Publishable key 已写入页面，注册、登录与学习记录云同步会连接到 Supabase 项目。
- Publishable key 专供浏览器使用，因此会出现在公开网页源码中；请勿使用 `sb_secret_...`、`service_role` 或其他服务端密钥。
- 首次使用前，在 Supabase SQL Editor 运行仓库中的 `supabase-setup.sql`。该脚本为 `study_state` 启用 RLS，并按登录用户限制读写。
- Publishable key 设计为可出现在前端；数据隔离依赖 SQL 中的 RLS 策略。不要在公开仓库放入 Secret / service_role key。

## 隐私与资料

- 本发布包只包含网页、SQL 初始化脚本和本说明，不包含教材 PDF、备份文件或本机学习记录。
- 学习记录在 Supabase 未启用时保存在当前浏览器；启用登录和云同步后，记录写入对应账号的数据库行。
- 课程参考资料链接列在网页“术语与来源”页。教材原件不随本仓库发布。
