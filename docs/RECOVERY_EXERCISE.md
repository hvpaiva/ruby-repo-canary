# Partial publication recovery exercise

This repository validates the shared maintenance tooling before existing Ruby
projects adopt it. Its release workflow intentionally fails the `github-release`
job for **v0.1.1, attempt 1 only**, after the separate RubyGems publication job has
succeeded. This fixture belongs only to the canary; it is not part of the generator.
Other versions and ordinary CI/rehearsal branches do not trigger the failure.

The shared release command must report the partial success and print a command
to rerun only the failed GitHub Release job. Before following that instruction,
record the RubyGems version, gem digest, signed tag object and successful publish
job identity. Then rerun the indicated job, allowing its normal artifact checksum
verification and GitHub Release creation to complete. Do not rerun the successful
publisher or recreate the tag.

GitHub's [run attempt context](https://docs.github.com/en/actions/reference/workflows-and-actions/contexts#github-context)
increments on retries. Its [job retry mechanism](https://cli.github.com/manual/gh_run_rerun)
allows the same workflow run and source commit to resume a specific job. On the
second attempt the fixture is skipped; no source edit or tag movement is needed.

Acceptance requires identical RubyGems/Actions/GitHub Release gem bytes, a valid
tag attestation, unchanged signed tag and RubyGems version creation timestamp,
and evidence that the publish job ran only once. A final replay of the shared
release command must recognize the completed run. Retain both attempts in the
toolkit's evidence documents; a green final attempt alone is insufficient proof.
