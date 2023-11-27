
template = ':%s a omni:Deliverable ;
    omni:hasModuleName "%s" ;
    omni:hasPlan "%s" ;
    omni:hasActivity "%s" ;
    omni:hasDockerImage "%s" ;
    omni:hasComputationalEnvironment "unimportant" ;
    omni:hasCommand "cut -f" ;
    omni:hasPreCommit "precommit_method1" ;
    omni:isInvalidated "False" ;
    omni:exitStatus 0 ;
    omni:isRebased "False" ;    
    omni:hasEpoch "epoch1" ;
    omni:hasLfsHash "%s" ;
    omni:hasFileName "%s" ;  
    omni:hasInputPath "%s" .

'

i <- 1
for (module in c('iris_accuracy_pval', 'iris_accuracy')) {
    for (seed in c(1, 12, 123, 1234, 1000)) {
        for (split in c(0.5, 0.6, 0.7, 0.8, 0.9, 1)) {
            for (dataset in c('iris-lda_iris-filtered_43889',
                              'iris-lda_iris-filtered_68f6d',
                              'iris-random_forest_iris-filtered_43889',
                              'iris-random_forest_iris-filtered_68f6d')) {
                
                id <- gsub('.', '', paste0('deliverable_', module, '_', seed, '_', split, '_', dataset),
                           fixed = TRUE)
                # module
                plan <- paste0('plan_', module)
                activity <- paste0('activity_', module, '_', seed, '_', split, '_', dataset)
                docker <- paste0('docker_', module)

                hash <- paste0('hash_', module, '_', seed, '_', split, '_', dataset)
                
                rds <- ifelse(grepl('lda', dataset), yes = 'lda', no = 'random_forest')
                filename <- paste0(module, '_', 'something_', i, '.json')

                inputpath <- paste0(dataset, '___rseed_', seed, '__train_split_', split, '_', rds, '_model.rds')
                
                cat(sprintf(template, id, module, plan, activity, docker, hash, filename, inputpath))
                i <- i+1
                
            }
        }
    }
}
