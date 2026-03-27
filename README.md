# X Algorithm Explorer

An Agent Skill for exploring and understanding X (Twitter) Recommendation Algorithm.

## Overview

This skill helps AI agents navigate and analyze the open-source X Recommendation Algorithm repository, which powers the For You Timeline, Search, Explore, and Notifications.

## Installation

```bash
# Clone this repository
git clone https://github.com/yourusername/x-algorithm-explorer.git

# Install the skill file
cp x-algorithm-explorer.skill ~/.openclaw/skills/
```

## Features

### Architecture Understanding
- **Core Data Services**: tweetypie, unified-user-actions, user-signal-service
- **ML Models**: SimClusters, TwHIN, trust-and-safety-models, heavy-ranker
- **Candidate Sources**: search-index, UTEG (GraphJet), FRS
- **Product Surfaces**: home-mixer, pushservice, tweet-mixer

### Quick Navigation
- Component overview and descriptions
- For You Timeline construction flow
- Graph-based recommendation analysis
- Content filtering mechanisms

## Usage

### As an Agent Skill
When working with the X algorithm codebase, this skill automatically provides:
- Architecture guidance
- Component navigation
- Explanation of ranking systems
- Content filtering details

### Command Line Tool
```bash
python scripts/explore.py list              # List all components
python scripts/explore.py info home-mixer   # Get component details
python scripts/explore.py timeline          # Explain timeline flow
```

## Repository Structure

```
x-algorithm-explorer/
├── SKILL.md                          # Skill definition
├── README.md                         # This file
├── references/
│   ├── README.md                     # Full X algorithm docs
│   ├── home-mixer.md                 # Timeline service docs
│   ├── product-mixer.md              # Feed framework docs
│   └── RETREIVAL_SIGNALS.md          # Signal documentation
└── scripts/
    └── explore.py                    # Navigation helper
```

## Key Components Explained

### For You Timeline Flow
1. **Candidate Sourcing** (~50% In-Network, Out-of-Network via GraphJet)
2. **Light Ranking** (Earlybird initial filtering)
3. **Heavy Ranking** (Neural network scoring)
4. **Mixing & Filtering** (home-mixer + visibility filters)

### ML Models
- **SimClusters**: Community detection and sparse embeddings
- **TwHIN**: Dense knowledge graph embeddings
- **Real Graph**: User interaction prediction
- **Tweepcred**: User reputation via PageRank

### Safety & Filtering
- **Visibility Filters**: Legal compliance, quality, trust
- **Trust & Safety Models**: NSFW and abuse detection
- **Hard/Soft Filtering**: Content treatment mechanisms

## References

- [X Engineering Blog](https://blog.x.com/engineering/en_us/topics/open-source/2023/twitter-recommendation-algorithm)
- [Original Repository](https://github.com/twitter/the-algorithm)
- [Open Source Announcement](https://blog.x.com/en_us/topics/company/2023/a-new-era-of-transparency-for-twitter)

## License

This skill references the X Algorithm repository which is licensed under AGPL-3.0.
