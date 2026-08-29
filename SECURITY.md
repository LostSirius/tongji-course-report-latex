# Security Policy

## Supported Version

Security fixes are applied to the latest released version of the template.

## Reporting a Vulnerability

Do not include private documents, real student IDs, access tokens, course materials, or other sensitive data in a public Issue.

For vulnerabilities that can be discussed publicly, open an Issue in this repository with:

- the affected template version;
- the relevant operating system and TeX distribution;
- a minimal reproduction without personal information;
- the expected and actual behavior;
- the security impact.

If public disclosure would expose users before a fix is available, contact the maintainer through the private security-reporting feature of the hosting repository when available.

## Shell Escape

The default configuration uses `minted=false` and does not enable `-shell-escape`. Only enable shell escape when you understand and trust every file compiled by the project.

## Untrusted LaTeX Sources

LaTeX documents and build scripts can execute external programs when unsafe options are enabled. Do not compile untrusted templates, bibliography styles, or downloaded source archives with elevated privileges.
