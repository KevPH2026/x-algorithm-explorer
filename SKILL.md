---
name: x-algorithm-explorer
description: Explore and analyze X (Twitter) Recommendation Algorithm codebase. Use when working with the X algorithm repository to understand architecture, navigate components, analyze recommendation systems, or explain how the For You Timeline and other product surfaces work. Helps with understanding SimClusters, TwHIN, GraphJet, home-mixer, heavy-ranker, and other core components.
---

# X Algorithm Explorer

Skill for exploring and understanding X (formerly Twitter) Recommendation Algorithm.

## Overview

This skill helps navigate and analyze the open-source X Recommendation Algorithm repository, which powers the For You Timeline, Search, Explore, and Notifications.

## Architecture Components

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

## Quick Navigation

### Understanding a Component
1. Check references/architecture.md for component overview
2. Look for README.md in the component's directory
3. Review source code in src/ directories

### Analyzing the For You Timeline
1. Start with home-mixer/ for the main service
2. Check heavy-ranker for ranking logic
3. Review candidate sources (UTEG, search-index)
4. Understand visibility-filters for content filtering

### Working with Graph-Based Recommendations
1. GraphJet framework in user_tweet_entity_graph
2. graph-feature-service for pairwise features
3. recos-injector for streaming event processing

## Key Files to Reference

- [README.md](references/README.md) - Full repository documentation
- [ARCHITECTURE.md](references/ARCHITECTURE.md) - System architecture details (if exists)
- Component READMEs in individual directories

## Common Tasks

### Explain How For You Timeline Works
Read home-mixer/README.md and trace through:
1. Candidate sourcing (search-index + UTEG + FRS)
2. Light ranking (earlybird)
3. Heavy ranking (neural network)
4. Mixing and filtering (home-mixer + visibility-filters)

### Understand Recommendation Ranking
Check heavy-ranker and light-ranker components:
- Features used for ranking
- Model architecture
- Scoring mechanisms

### Analyze Content Filtering
Review visibilitylib/ for:
- Hard filters (legal compliance)
- Soft filters (quality, trust)
- Downranking mechanisms

## Code Structure

```
the-algorithm/
├── home-mixer/          # Main timeline service
├── product-mixer/       # Framework for content feeds
├── recos-injector/      # Event processor for GraphJet
├── graph-feature-service/ # Pairwise user features
├── follow-recommendations-service/ # Account recommendations
├── trust_and_safety_models/ # Content safety
├── visibilitylib/       # Content filtering
├── navi/                # ML model serving (Rust)
├── twml/                # Legacy ML framework (TensorFlow v1)
└── src/                 # Source code
    ├── scala/com/twitter/
    │   ├── simclusters_v2/    # SimClusters
    │   ├── recos/             # Recommendation algorithms
    │   │   └── user_tweet_entity_graph/  # GraphJet
    │   └── interaction_graph/ # Real graph
    └── python/twitter/
        └── deepbird/projects/timelines/  # Ranking models
```
