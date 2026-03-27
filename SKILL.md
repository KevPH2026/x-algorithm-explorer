---
name: x-algorithm-explorer
version: 2.0.0
author: KevPH2026
description: |
  Explore and analyze X (Twitter) Recommendation Algorithm codebase.
  
  Use this skill when working with the X algorithm repository to:
  - Understand overall architecture
  - Navigate components (SimClusters, TwHIN, GraphJet)
  - Analyze recommendation systems
  - Explain For You Timeline construction
  - Understand home-mixer, heavy-ranker, and other core components

keywords:
  - twitter
  - x-algorithm
  - recommendation-system
  - machine-learning
  - simclusters
  - graphjet
  - home-mixer

install: ./install.sh
homepage: https://github.com/KevPH2026/x-algorithm-explorer
license: AGPL-3.0
---

# X Algorithm Explorer

OpenClaw Skill for exploring X (formerly Twitter) Recommendation Algorithm.

## Quick Start

After installation, ask your agent:

```
"Explain how X's recommendation algorithm works"
"What is SimClusters?"
"How does the For You Timeline get constructed?"
"Show me the components of home-mixer"
```

## Architecture Overview

### Core Data Services
- **tweetypie**: Core service for reading/writing post data
- **unified-user-actions**: Real-time stream of user actions  
- **user-signal-service**: Explicit (likes, replies) and implicit (profile visits, clicks) signals

### Machine Learning Models
- **SimClusters**: Community detection and sparse embeddings
- **TwHIN**: Dense knowledge graph embeddings for Users and Posts
- **trust-and-safety-models**: NSFW and abusive content detection
- **real-graph**: Predicts likelihood of user interactions
- **tweepcred**: PageRank algorithm for user reputation
- **heavy-ranker**: Neural network for ranking candidate posts

### Candidate Sources
- **search-index**: In-Network posts (~50% of timeline)
- **user-tweet-entity-graph (UTEG)**: User-to-Post interaction graph using GraphJet
- **follow-recommendation-service (FRS)**: Account recommendations

### Product Surfaces
- **home-mixer**: Constructs and serves Home Timeline
- **pushservice**: Recommendation service for notifications
- **tweet-mixer**: Out-of-Network tweet candidates

## For You Timeline Flow

```
1. Candidate Sourcing
   ├─ search-index (In-Network ~50%)
   ├─ UTEG/GraphJet (Out-of-Network)
   └─ FRS (Account recommendations)

2. Light Ranking (earlybird)
   └─ Initial filtering

3. Heavy Ranking (heavy-ranker)
   └─ Neural network scoring

4. Mixing & Filtering
   ├─ home-mixer (blend sources)
   └─ visibility-filters (safety/quality)
```

## Common Queries

### Understanding Components
- "Explain SimClusters and how it works"
- "What is the purpose of home-mixer?"
- "How does GraphJet enable real-time recommendations?"

### Architecture Questions
- "Walk me through the For You Timeline construction"
- "What are the different ranking stages?"
- "How are candidates sourced?"

### Technical Deep Dives
- "Explain the heavy-ranker neural network"
- "What signals does TwHIN use?"
- "How does visibility filtering work?"

## File References

- [references/README.md](references/README.md) - Full repository documentation
- [references/home-mixer.md](references/home-mixer.md) - Timeline service
- [references/product-mixer.md](references/product-mixer.md) - Feed framework
- [references/RETREIVAL_SIGNALS.md](references/RETREIVAL_SIGNALS.md) - Signal types

## External Resources

- [X Algorithm Blog Post](https://blog.x.com/engineering/en_us/topics/open-source/2023/twitter-recommendation-algorithm)
- [Original Repository](https://github.com/twitter/the-algorithm)

## Changelog

### v2.0.0
- Added one-click install script
- Added package.sh for .skill file generation
- Updated documentation with quick start guide
- Added architecture diagrams

### v1.0.0
- Initial release
- Basic component documentation
