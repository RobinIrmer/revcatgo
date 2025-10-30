# Coding Rules

## 1. Communication & Style

- Write code comments, commit messages, and pull request titles and summaries in English.
- Use docstrings and documentation in English; follow the rules in Section 3.

## 2. Workflow & Commits

- Separate development tasks from commit tasks unless otherwise instructed.
- Execute commits only after receiving explicit instructions from the developer.
- Use the Conventional Commits format for git commit messages.
  - Reference: <https://www.conventionalcommits.org/en/v1.0.0/>
  - Format:

    ```text
    <type>[optional scope]: <description>

    [optional body]
    ```

  - Types: `fix`, `feat`, `chore`, `doc`, `refactor`, `test`
  - Add a scope when relevant, e.g., `fix(admin): ...`
- Split commits by scope if multiple files change; keep unrelated changes (e.g., README vs features) in separate commits.
- Always run `make fmt` and `make test` before creating a commit to keep CI green
