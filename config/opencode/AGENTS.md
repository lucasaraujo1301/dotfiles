# Global OpenCode Instructions


## Edit Approval Preference

- When editing more than one file, do not bundle multiple file changes into a single `apply_patch` call. Ask for approval separately for each file by applying one file per patch.


## RTK Compact Command Preference

- Use `bash` commands for file listing, reading, and content search instead of dedicated file tools. Prefer `rtk ls`, `rtk read`, `rtk find`, and `rtk grep` for those operations.
- Prefer the `rtk` prefix for supported shell commands to reduce token-heavy output while preserving useful diagnostics.
- Use regular commands when a dedicated tool is required by higher-priority instructions, when full raw output is necessary, or when `rtk` is unavailable.

### Files

- `rtk ls .` - Token-optimized directory tree
- `rtk read file.rs` - Smart file reading
- `rtk read file.rs -l aggressive` - Signatures only, strips bodies
- `rtk smart file.rs` - 2-line heuristic code summary
- `rtk find "*.rs" .` - Compact find results
- `rtk grep "pattern" .` - Grouped search results
- `rtk diff file1 file2` - Condensed diff, exit 1 if files differ

### Git

- `rtk git status` - Compact status
- `rtk git log -n 10` - One-line commits
- `rtk git diff` - Condensed diff
- `rtk git add` - Returns `ok`
- `rtk git commit -m "msg"` - Returns `ok abc1234`
- `rtk git push` - Returns `ok main`
- `rtk git pull` - Returns `ok 3 files +10 -2`

### GitHub CLI

- `rtk gh pr list` - Compact PR listing
- `rtk gh pr view 42` - PR details plus checks
- `rtk gh issue list` - Compact issue listing
- `rtk gh run list` - Workflow run status

### Test Runners

- When running pytest, always use `uv run rtk pytest ...`.
- `rtk jest` - Jest compact, failures only
- `rtk vitest` - Vitest compact, failures only
- `rtk playwright test` - E2E results, failures only
- `rtk pytest` - Python tests, about 90% less output
- `rtk go test` - Go tests, NDJSON, about 90% less output
- `rtk cargo test` - Cargo tests, about 90% less output
- `rtk rake test` - Ruby minitest, about 90% less output
- `rtk rspec` - RSpec tests, JSON, 60%+ less output
- `rtk err <cmd>` - Filter errors only from any command
- `rtk test <cmd>` - Generic test wrapper, failures only, about 90% less output

### Build And Lint

- `rtk lint` - ESLint grouped by rule/file
- `rtk lint biome` - Supports other linters
- `rtk tsc` - TypeScript errors grouped by file
- `rtk next build` - Next.js build compact
- `rtk prettier --check .` - Files needing formatting
- `rtk cargo build` - Cargo build, about 80% less output
- `rtk cargo clippy` - Cargo clippy, about 80% less output
- `rtk ruff check` - Python linting, JSON, about 80% less output
- `rtk golangci-lint run` - Go linting, JSON, about 85% less output
- `rtk rubocop` - Ruby linting, JSON, 60%+ less output

### Package Managers

- `rtk pnpm list` - Compact dependency tree
- `rtk uv run pytest` - Preserve uv env, errors only
- `rtk pip list` - Python packages, auto-detect uv
- `rtk pip outdated` - Outdated packages
- `rtk bundle install` - Ruby gems, strip `Using` lines
- `rtk prisma generate` - Schema generation, no ASCII art

### AWS

- `rtk aws sts get-caller-identity` - One-line identity
- `rtk aws ec2 describe-instances` - Compact instance list
- `rtk aws lambda list-functions` - Name/runtime/memory, strips secrets
- `rtk aws logs get-log-events` - Timestamped messages only
- `rtk aws cloudformation describe-stack-events` - Failures first
- `rtk aws dynamodb scan` - Unwraps type annotations
- `rtk aws iam list-roles` - Strips policy documents
- `rtk aws s3 ls` - Truncated with tee recovery

### Containers

- `rtk docker ps` - Compact container list
- `rtk docker images` - Compact image list
- `rtk docker logs <container>` - Deduplicated logs
- `rtk docker compose ps` - Compose services
- `rtk kubectl pods` - Compact pod list
- `rtk kubectl logs <pod>` - Deduplicated logs
- `rtk kubectl services` - Compact service list
- `rtk oc get pods` - OpenShift pod summary
- `rtk oc get services` - OpenShift service list
- `rtk oc logs <pod>` - Deduplicated logs

### Infrastructure As Code

- `rtk pulumi preview` - Strip header/URL/duration noise
- `rtk pulumi up` - Compact apply output
- `rtk pulumi destroy` - Compact destroy output
- `rtk pulumi refresh` - Drift summary
- `rtk pulumi stack` - Stack metadata, strips owner/timestamps

### Data And Analytics

- `rtk json config.json` - Structure without values
- `rtk deps` - Dependencies summary
- `rtk env -f AWS` - Filtered env vars
- `rtk log app.log` - Deduplicated logs
- `rtk curl <url>` - Truncate and save full output
- `rtk wget <url>` - Download, strip progress bars
- `rtk summary <long command>` - Heuristic summary
- `rtk proxy <command>` - Raw passthrough plus tracking

### Token Savings Analytics

- `rtk gain` - Summary stats
- `rtk gain --graph` - ASCII graph for last 30 days
- `rtk gain --history` - Recent command history
- `rtk gain --daily` - Day-by-day breakdown
- `rtk gain --all --format json` - JSON export for dashboards
- `rtk discover` - Find missed savings opportunities
- `rtk discover --all --since 7` - All projects, last 7 days
- `rtk session` - Show RTK adoption across recent sessions

### Global Flags

- `-u`, `--ultra-compact` - ASCII icons, inline format, extra token savings
- `-v`, `--verbose` - Increase verbosity, supports `-v`, `-vv`, `-vvv`
