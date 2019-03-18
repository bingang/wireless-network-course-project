clc;
clear;

addpath('../lib');

import BaseStation;
import MobileStation;
import Cell;
import HexagonGrid;
import RadioPropagation;
import TwoRay;
import Lognormal;
import Shadowing;
import Clock;

import util.*;
ut = util();

run handoff_criteria.m;
run problem_settings.m;

run init.m;

run simulation.m;

