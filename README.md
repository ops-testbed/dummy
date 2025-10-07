## Git Branch & Deployment Strategy

### Branch Structure

- main: Production (Live Zone)
- develop: Development (Dev Zone)
- feature/*: Feature development branches

### Branch Protection Rules

- Settings -> Branches -> Add classic branch protection rule
- Branch name pattern: main|develop|feature/*
    - Require status checks to pass before merging 활성화
    - Status checks that are required -> test, validation 추가
- main, develop 브랜치에 **direct push 금지**
- merge는 반드시 Pull Request(PR)를 통해서만 가능

### Merge Flow

```text
feature/* —PR—> develop —PR—> main
```

### Deployment Zones

- **develop branch = Dev Zone**
    - `feature/*` → `develop` PR merge → **Dev Zone 자동 배포**

- **main branch = Live Zone**
    - `develop` → `main` PR merge → **Staging Zone 자동 배포 (실습이라 제외)** → **Live Zone 수동 배포 (카나리 적용)** 
