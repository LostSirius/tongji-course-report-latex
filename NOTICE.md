# 来源、许可证与修改声明

## 项目性质

本项目是一个面向同济大学课程作业场景的非官方 LaTeX 模板，不代表同济大学或任何学院的官方格式要求。

## 直接上游

本项目的文档类和初始仓库结构派生自：

- **TJ-CSCCG/TongjiThesis**（原仓库地址为 `TJ-CSCCG/tongji-undergrad-thesis`）
- 当前项目地址：[TJ-CSCCG/TongjiThesis](https://github.com/TJ-CSCCG/TongjiThesis)
- 原版权声明：Copyright 2023--2025 TJ-CSCCG
- 许可证：LaTeX Project Public License 1.3c

原上游的版权与许可证声明保留在 `style/tongjithesis.cls`。本仓库继续按照 LPPL 1.3c 分发；许可证全文见 `LICENSE`。

## 本修改版

- 维护者：LostSirius
- 修改版年份：2026
- 当前版本：2.0.0

相对于上游课程设计/大作业模板，本修改版主要进行了以下工作：

1. 去除装订线并将页面版心改为左右居中。
2. 将计算机学院和计算机学科相关的硬编码改为可配置字段。
3. 新增 `\tongjisetup{...}` 集中式键值配置接口，同时保留旧命令兼容性。
4. 增加学院、系所、专业、学期、班级、报告类型等通用字段。
5. 将正文示例改写为覆盖理工医科、人文社科、经管法、建筑设计和艺术类的通用骨架。
6. 默认关闭 `minted`，降低首次编译的外部依赖。
7. 重写中英文 README、引用元数据和仓库说明。
8. 清除示例中的真实个人信息，仅保留占位符。

## 设计与文档参考

重构过程中参考了以下公开项目的用户接口、仓库组织、构建说明与文档实践：

- [**UCAS_Latex_Template**](https://github.com/jweihe/UCAS_Latex_Template)
- [**NJUrepo**](https://github.com/nju-lug/NJUrepo)
- [**ThuThesis**](https://github.com/tuna/thuthesis)
- [**SJTUThesis**](https://github.com/sjtug/SJTUThesis)
- [**fduthesis**](https://github.com/stone-zeng/fduthesis)

除“直接上游”一节明确列出的项目外，本项目仅声明借鉴这些项目的公开设计思想与文档实践，不声明复制其代码，也不暗示这些项目的作者为本修改版提供维护或支持。

## 商标与校徽

“同济大学”名称、标识及相关视觉资产的权利归其各自权利人所有。本模板中的相关资源仅用于教学与排版示例。公开再发布或商业使用前，使用者应自行确认相关授权和学校规定。

`figures/tongji.pdf` 随直接上游 `TJ-CSCCG/TongjiThesis` 获取，用作封面和页眉的示例标识。该资源不因本项目采用 LPPL 1.3c 而获得额外的商标或视觉识别授权；公开分发、修改或商业使用前应自行确认同济大学的相关规定。使用者也可以通过 `logo-path` 将其替换为已获授权的图片。

`figures/tongji-latex-readme-banner.png` 的桥梁与书本底图由 OpenAI GPT 图像生成模型辅助创作，LaTeX 字标由标准 `\LaTeX` 排版命令渲染。该横幅是本修改版原创的非官方项目标识，不是同济大学校徽，不得用于暗示同济大学或任何学院对本项目的官方认可。

## 引用建议

一般课程作业只需按教师要求提交，无需在正文中引用模板。若研究、介绍、再开发或再发布本模板，建议同时注明：

1. 本修改版：LostSirius, *同济大学通用课程报告 LaTeX 模板*, version 2.0.0, 2026。
2. 直接上游：[TJ-CSCCG/TongjiThesis](https://github.com/TJ-CSCCG/TongjiThesis)。
