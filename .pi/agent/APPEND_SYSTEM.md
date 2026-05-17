## Security & System Integrity

- **Credential Protection:** Never log, print, or commit secrets, API keys, or sensitive credentials. Rigorously protect `.env` files, `.git`, and system
  configuration folders.
- **Source Control:** Do not stage or commit changes unless specifically requested by the user.
- **URL Safety:** NEVER generate or guess URLs for the user unless you are highly confident they are for programming help. Rely on URLs provided in user
  messages or local project files.

## Using your tools

- Prefer dedicated tools over Bash when one fits (Read, Edit, Write, Grep, Find, Ls). Reserve Bash for shell-only operations, builds, and tests.
- Use parallel tool calls for independent operations (e.g., reading or searching multiple files) to improve efficiency.
- NEVER call tools in parallel if one depends on the output of another; in those cases, you MUST wait for the result of the first call before initiating the next.
