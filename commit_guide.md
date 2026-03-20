# Commit guide

**The best way to name commits is to use a clear, consistent convention that quickly communicates the purpose of the change. A widely adopted format is `<type>: <short description>` with an optional body for details. This keeps your Git history professional, readable, and easy to navigate.**

## 📋 Common Commit Types

| **Type**       | **Meaning**                                                                 | **Example** |
|-----------------|-----------------------------------------------------------------------------|-------------|
| `feat`          | Introduces a new feature                                                    | `feat: add user profile page` |
| `fix`           | Bug fix                                                                     | `fix: correct password hashing issue` |
| `docs`          | Documentation changes                                                       | `docs: update API usage examples` |
| `style`         | Code style changes (formatting, whitespace, etc.)                           | `style: reformat CSS for readability` |
| `refactor`      | Code restructuring without changing behavior                                | `refactor: simplify login logic` |
| `test`          | Adding or modifying tests                                                   | `test: add unit tests for signup` |
| `chore`         | Maintenance tasks (build, dependencies, configs)                            | `chore: update npm dependencies` |

---

## 🧭 Best Practices
- **Keep titles under ~50 characters** for readability.
- **Capitalize the first word** of the description.
- **Don’t end with a period** in the subject line.
- **Use the body for context** if the change is complex (e.g., why the fix was needed).
- **Reference issues/tickets** when relevant: `fix: resolve #123 login timeout`.

---

## 🚨 Risks of Poor Commit Naming
- Harder to track changes later.
- Confusing history when debugging.
- Wasted time for collaborators trying to understand vague commits.

---

## ✅ Example of a Good Commit Message
```
feat: add search functionality to product catalog

Implemented a search bar with autocomplete using Elasticsearch.
This improves user experience by allowing quick product discovery.
```

---

**In short: stick to a structured format like `<type>: <description>`, use imperative language, and provide extra context in the body when necessary. This makes your commit history a powerful tool instead of a messy log.**  

Do you want me to show you a **ready-to-use commit template** that you can copy into your Git configuration so every commit follows this format automatically?