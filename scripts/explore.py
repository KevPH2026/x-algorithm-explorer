#!/usr/bin/env python3
"""
X Algorithm Explorer - Navigation Helper
Helps explore the X Recommendation Algorithm codebase
"""

import os
import sys
import json
from pathlib import Path

# Component mapping for quick navigation
COMPONENTS = {
    "home-mixer": {
        "path": "home-mixer",
        "description": "Main service for Home Timeline construction",
        "key_files": ["README.md", "ProductMixer.scala"]
    },
    "heavy-ranker": {
        "path": "src/python/twitter/deepbird/projects/timelines",
        "description": "Neural network for ranking posts",
        "key_files": ["README.md"]
    },
    "simclusters": {
        "path": "src/scala/com/twitter/simclusters_v2",
        "description": "Community detection and embeddings",
        "key_files": ["README.md"]
    },
    "graphjet": {
        "path": "src/scala/com/twitter/recos/user_tweet_entity_graph",
        "description": "User-to-Post interaction graph",
        "key_files": ["README.md"]
    },
    "tweetypie": {
        "path": "tweetypie",
        "description": "Core post data service",
        "key_files": ["server/README.md"]
    },
    "visibility": {
        "path": "visibilitylib",
        "description": "Content filtering and safety",
        "key_files": ["README.md"]
    }
}

def list_components():
    """List all major components"""
    print("=== X Algorithm Components ===\n")
    for name, info in COMPONENTS.items():
        print(f"{name}")
        print(f"  Path: {info['path']}")
        print(f"  Description: {info['description']}")
        print()

def get_component_info(component_name):
    """Get information about a specific component"""
    if component_name not in COMPONENTS:
        print(f"Component '{component_name}' not found.")
        print(f"Available: {', '.join(COMPONENTS.keys())}")
        return
    
    info = COMPONENTS[component_name]
    print(f"=== {component_name} ===")
    print(f"Description: {info['description']}")
    print(f"Path: {info['path']}")
    print(f"Key files: {', '.join(info['key_files'])}")

def explain_timeline_flow():
    """Explain how the For You Timeline is constructed"""
    flow = """
=== For You Timeline Construction Flow ===

1. CANDIDATE SOURCING
   ├─ search-index: In-Network posts (~50%)
   ├─ UTEG (GraphJet): Out-of-Network via graph traversal
   └─ FRS: Recommended accounts' posts

2. LIGHT RANKING (Earlybird)
   └─ Initial filtering and scoring

3. HEAVY RANKING (Neural Network)
   └─ Deep model for final relevance scoring

4. MIXING & FILTERING
   ├─ home-mixer: Timeline assembly
   └─ visibility-filters: Safety/quality filtering

Key Signals Used:
- SimClusters: Community embeddings
- TwHIN: Knowledge graph embeddings  
- Real Graph: Interaction probability
- User signals: Likes, replies, clicks, dwell time
"""
    print(flow)

def main():
    if len(sys.argv) < 2:
        print("Usage: python explore.py [command] [args]")
        print("\nCommands:")
        print("  list              - List all components")
        print("  info <component>  - Get component info")
        print("  timeline          - Explain timeline flow")
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "list":
        list_components()
    elif command == "info":
        if len(sys.argv) < 3:
            print("Usage: python explore.py info <component-name>")
            sys.exit(1)
        get_component_info(sys.argv[2])
    elif command == "timeline":
        explain_timeline_flow()
    else:
        print(f"Unknown command: {command}")
        print("Use 'list', 'info', or 'timeline'")

if __name__ == "__main__":
    main()
