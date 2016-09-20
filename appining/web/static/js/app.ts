// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import "phoenix_html"
// import {platformBrowserDynamic} from '@angular/platform-browser-dynamic';
// import socket from "./socket"

import foo from './foo'
import 'zone.js';
import 'reflect-metadata';

import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app/app.module';


const platform = platformBrowserDynamic();
platform.bootstrapModule(AppModule);
