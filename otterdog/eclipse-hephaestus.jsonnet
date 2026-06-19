local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local default_branch_protection_rule(pattern) =
  orgs.newBranchProtectionRule(pattern) {
    required_approving_review_count: 1,
    requires_linear_history: true,
  };


orgs.newOrg('automotive.hephaestus', 'eclipse-hephaestus') {
  settings+: {
    name: "Eclipse SDV Hephaestus project",
  },
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github'),
    orgs.newRepo('hephaestus'){
      description: "Hephaestus project main repository",
      allow_rebase_merge: false,
      allow_merge_commit: false,
      allow_squash_merge: true,
      has_discussions: true,

      gh_pages_build_type: "workflow",
      homepage: "https://eclipse-hephaestus.github.io/hephaestus",

      branch_protection_rules: [
        default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('website'){
      description: "Eclipse SDV Hephaestus project website",
      allow_rebase_merge: false,
      allow_merge_commit: false,
      allow_squash_merge: true,

      gh_pages_build_type: "workflow",
      homepage: "https://eclipse-hephaestus.github.io/hephaestus",

      branch_protection_rules: [
        default_branch_protection_rule('main')
      ],
    },
  ],
}
