import { createStore, combineReducers, applyMiddleware, compose } from 'redux';
import keplerGlReducer from 'kepler.gl/reducers';
import { enhanceReduxMiddleware } from 'kepler.gl/middleware';
import appReducer from './app-reducer';

const reducers = combineReducers({
  keplerGl: keplerGlReducer,
  app: appReducer
});

const middlewares = enhanceReduxMiddleware([]);
const enhancers = [applyMiddleware(...middlewares)];


export default createStore(reducers, {}, compose(...enhancers));