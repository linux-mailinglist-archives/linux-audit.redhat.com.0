Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754D5F0C48
	for <lists+linux-audit@lfdr.de>; Fri, 30 Sep 2022 15:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664543685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tPSHompAjEepkF1eWbWBBnOz2OWajv0kaBIIFme0kd8=;
	b=UsiVK/hofDwhB9VjF0JsV7zGQLhLxBglFo/AMAuJlTPdFe6K/XY4ZWWawREUEPrlEG1fQa
	frlX5/LZiQTIswNb8od3vUP+lGEtPp9JtRKHF2/gLKpI3jF2rzJfcQ1kbvzpuTeBQ2DBg4
	f3qTpv07yfB7WDDFdb+IJYdiRxOz7Cs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-RN2ukA6zPhSc6454aq3CYg-1; Fri, 30 Sep 2022 09:14:43 -0400
X-MC-Unique: RN2ukA6zPhSc6454aq3CYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 223BD10726A1;
	Fri, 30 Sep 2022 13:14:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CEA3207B34A;
	Fri, 30 Sep 2022 13:14:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A87F1946A76;
	Fri, 30 Sep 2022 13:14:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBD521946A4E for <linux-audit@listman.corp.redhat.com>;
 Thu, 29 Sep 2022 20:20:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81545492B06; Thu, 29 Sep 2022 20:20:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 773E2492B04
 for <linux-audit@redhat.com>; Thu, 29 Sep 2022 20:20:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE19438164CE
 for <linux-audit@redhat.com>; Thu, 29 Sep 2022 20:20:07 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-cNvTVU-jM123AAIfIHl8pg-1; Thu, 29 Sep 2022 16:20:03 -0400
X-MC-Unique: cNvTVU-jM123AAIfIHl8pg-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TJmwXN012062;
 Thu, 29 Sep 2022 20:20:02 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jsstpwd78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 20:20:01 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28THVmhF033772; Thu, 29 Sep 2022 20:20:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpv35kfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 20:20:00 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH0PR10MB5779.namprd10.prod.outlook.com (2603:10b6:510:146::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 20:19:58 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5676.022; Thu, 29 Sep 2022
 20:19:58 +0000
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-3-ankur.a.arora@oracle.com>
 <CAHC9VhRBuBiuf6917fpP7n+Sy5fFTpzzEqRXfMGPCbnNU4jswg@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 2/3] audit: annotate branch direction for audit_in_mask()
In-reply-to: <CAHC9VhRBuBiuf6917fpP7n+Sy5fFTpzzEqRXfMGPCbnNU4jswg@mail.gmail.com>
Date: Thu, 29 Sep 2022 13:19:57 -0700
Message-ID: <8735cagcgi.fsf@oracle.com>
X-ClientProxiedBy: MW3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:303:2b::24) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH0PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: effd1dd9-fd0f-40c5-d1ec-08daa257fad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: nNzGJoLHX8N9VHzy5AbsE3Wvwcke/68qP43NaouBnII/DYzdlFJLKaQtVDD7lMrYcXb+uwdtgTu7bdcuSa3ftkkw9F6rXU3/oapYjJ3Buq72KS7uPs2xWEtYHtgYgmlp9xsPtjFZnxcX1RhQTYBZwhFFQDCbx3/DGaCayxAaMejX3ymwPNaRrYuw8TaccGyb7Fzxad4x1EyfweMY7fKGfXXV9gpe4WU+pIxMt/G6vKtLWArhddo0S/1bxwH7vxvVxPKFbtMIMTpjCXFiHkrYRCJUXmq1iR4kfG+vdGU9C9lsx4EMAOgmiUFgZPPPCVmh01nJiRpQQE+9VCzb4zeSBN4+6CTPr/W4SRddTly7RJiwNwZdri3iLUOIVMA2KQFR5aU2jkTVVD3WEKB9g9QfVhlveS1QtrCh68aOl/5WuZBHacug5TPpMjxMkftfU7tULeRltAUeDghWILDKL+WhrgBs2qvaeRfxyB2QBW+tPVJAuH0veXEyeJUizYYluKv/eJ6KnppekBUsVDxPh7XUPC2I18lFbi6zN+EcEYipUpGKKraMq651qIs7mBCWXbMdvCvO92DR//avZ9IyOwDRWVlL/jOjqZTrYhZuh5qnb3CMvLs/t4rUtXgoVmBRlx6ol85qod9QWMedNuyM/IUV+z895tPIAdK+0VyxiD/W3P1pS4ZQjtIOkXnjBz3lYc/Om17Hxp4mniggCtDtlxQnqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(478600001)(38100700002)(6486002)(4326008)(8676002)(66946007)(186003)(6916009)(36756003)(26005)(66556008)(66476007)(6512007)(83380400001)(2906002)(8936002)(41300700001)(53546011)(6506007)(107886003)(316002)(5660300002)(2616005)(86362001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6tSaMAzrwkXL1iGOB/rZjB0fbdeehEDtgAjzKtZkjD+DccKkH0YPOuay9e5?=
 =?us-ascii?Q?pOeNwsqfmwzKzMI2z9E7twt7iMfMjXheb7ayPtFedyPGmr3Lh9CUetVUzxOV?=
 =?us-ascii?Q?PqntNHxJVrH9pzOao9QxdzK+ehdMueSJV61vG4pFOaMrYWESowepaY6fvw76?=
 =?us-ascii?Q?Tcq73YrOSvJkcsPfEvo9qbQPGT2Pvrgs6tRyiKyL4Q3jEyi5rlYLCBD9CZ1g?=
 =?us-ascii?Q?pKio8Y/R5nkRcDg7NUoK97KDILH4ERgU4sDEEBQtQ0OsDhpZdjm1WS42SUeb?=
 =?us-ascii?Q?8nVdJFVaizYRtbuEbLYMbjVp0N/lpjr2iNB/Z4kMB9GCn7evn1ZQ2u3QCXgP?=
 =?us-ascii?Q?9hLJiNeDYB2htkHwMQItEOl0zwzKtwPFeBIvbbDW47YZyacyvKk9TbqiwMHa?=
 =?us-ascii?Q?N8Co2juVMQmm83IpJRLzTMIXLngnV1x3Rc2153iX6MDDksraW7LgDTd7gxuB?=
 =?us-ascii?Q?Am90rmuzc+jMEzHvsWtrQUCtb1V55J8F0V3+/rZEL0b2JSk/dbT9Rx9THHwJ?=
 =?us-ascii?Q?+2nBC4A2XlxUDPcEpPZt/+esOUxJleQuKscNe170VAZuwQdeMNp7f4dQTbJJ?=
 =?us-ascii?Q?6ZRTHYIffnopjY0Cw2DEBZ3FRSV+RLp/L/Z5bq6bSACa4wfYCybKaOCzIvqY?=
 =?us-ascii?Q?eXkwOA0trOca9Rj6Q/aQUr+zxLuZjibNQBjIn79hLMLlzT05H6gvHMIIlAbN?=
 =?us-ascii?Q?2Q8Qk0O7sOUGYSXnWmEVLw9CSY9uLBd+uh6lwGj03ikl0L+0+e+ryVokdta6?=
 =?us-ascii?Q?zWQ4u+EfNEiiIgOZPIt5DDAL2CeJGz2cnyXDmYU+jPsxg0IdIu1Mg7HUSHBP?=
 =?us-ascii?Q?DyyQQ/pQN+7EVTDry4DFtwFuPCWIAZLpr4SfkeeuheyH6JB2vESy4b5EqjZW?=
 =?us-ascii?Q?Xau2jnuIWsAL0DnVK79sN6J9JgKwplkynw+s/VzjwcqylloNpYzbr1kYc7W6?=
 =?us-ascii?Q?0ouEwaJzX8ReeQEkaGwM45nxLpGEg4BHt6vC5x3fOYbcdjH36YBjtEauI3HR?=
 =?us-ascii?Q?NN/eRtnomzyJXmNUARMtMB3QZPsb0g3CS2Hoj6eYbO05jFAWKC09NsJfPL3t?=
 =?us-ascii?Q?X7YlyObHPjnN0DmI75ib/Qfv8Yf0NZqltVGW1YapIQV10ba0gYQEXVMCJhXS?=
 =?us-ascii?Q?ETSHKJebjXeYVbrIUjEaY7t37Bn+yCgSwENXjBQlkMHm0wIg8c+gTaxxTOFu?=
 =?us-ascii?Q?BT+TFlQE2yIs0otcP6Wm+GpkOF/XDehcw2JZ7wKWeXUXxJ2i06nRNBzybekl?=
 =?us-ascii?Q?3jjrvDwXs96XMLrJMz3J5phK8SbRrRhlhDPdCeTGJQy1bwWtwzpLgVpQfDGo?=
 =?us-ascii?Q?S5xyw/sB2tlWEKS4cpQAZc7DOre484kNaU+t2gFvS25ee6erS7WmanJCd2/2?=
 =?us-ascii?Q?OGZZ4BZY3zTapSauOWsvvvX05PL6FNZ8dqLKXCYlASnu+1SoEl0Xy7tUOIaq?=
 =?us-ascii?Q?lVKdtp6LSBtfbTtats1q8LobFEtOohsnQl/6YNGJ+evEIoBlzQu5eMG3iKIt?=
 =?us-ascii?Q?j0uvxHa9WMeE3CD4jgP+HtkGzvDPDlgqqAwIL81IRfqFqiIFpwq5pr9ZTGRT?=
 =?us-ascii?Q?eNWEG6ME300YoS1FEKjNySMY+TpB4bpkEvdB2NMetMnQ20FKYBokfFJLNNbb?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effd1dd9-fd0f-40c5-d1ec-08daa257fad3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 20:19:58.7261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtCRR1CmsSlCHeFhQ/MK7QQ+ciW2FgL07Vz1bEcoZhe+QN7dJIdPk+5eDm1G8ywkMGefRtqKJc4XDzThZq0n8VT17dhc8iXNslPHSQndICM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290128
X-Proofpoint-ORIG-GUID: leFE74JVTL-7_7BHeCE_T-sRm69-P-FR
X-Proofpoint-GUID: leFE74JVTL-7_7BHeCE_T-sRm69-P-FR
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 30 Sep 2022 13:14:22 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, eparis@redhat.com,
 linux-audit@redhat.com, Ankur Arora <ankur.a.arora@oracle.com>,
 boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Paul Moore <paul@paul-moore.com> writes:

> On Tue, Sep 27, 2022 at 7:00 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>>
>> With sane audit rules, audit logging would only be triggered
>> infrequently. Keeping this in mind, annotate audit_in_mask() as
>> unlikely() to allow the compiler to pessimize the call to
>> audit_filter_rules().
>>
>> This allows GCC to invert the branch direction for the audit_filter_rules()
>> basic block in this loop:
>>
>>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
>>                 if (audit_in_mask(&e->rule, major) &&
>>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
>>                                        &state, false)) {
>>                         ...
>>
>> such that it executes the common case in a straight line fashion.
>>
>> On a Skylakex system change in getpid() latency (all results
>> aggregated across 12 boot cycles):
>>
>>          Min     Mean    Median   Max      pstdev
>>          (ns)    (ns)    (ns)     (ns)
>>
>>  -    196.63   207.86  206.60  230.98      (+- 3.92%)
>>  +    173.11   182.51  179.65  202.09      (+- 4.34%)
>>
>> Performance counter stats for 'bin/getpid' (3 runs) go from:
>>     cycles               805.58  (  +-  4.11% )
>>     instructions        1654.11  (  +-   .05% )
>>     IPC                    2.06  (  +-  3.39% )
>>     branches             430.02  (  +-   .05% )
>>     branch-misses          1.55  (  +-  7.09% )
>>     L1-dcache-loads      440.01  (  +-   .09% )
>>     L1-dcache-load-misses  9.05  (  +- 74.03% )
>>
>>  to:
>>     cycles               706.13  (  +-  4.13% )
>>     instructions        1654.70  (  +-   .06% )
>>     IPC                    2.35  (  +-  4.25% )
>>     branches             430.99  (  +-   .06% )
>>     branch-misses          0.50  (  +-  2.00% )
>>     L1-dcache-loads      440.02  (  +-   .07% )
>>     L1-dcache-load-misses  5.22  (  +- 82.75% )
>>
>> (Both aggregated over 12 boot cycles.)
>>
>> cycles: performance improves on average by ~100 cycles/call. IPC
>> improves commensurately. Two reasons for this improvement:
>>
>>   * one fewer branch mispred: no obvious reason for this
>>     branch-miss reduction. There is no significant change in
>>     basic-block structure (apart from the branch inversion.)
>>
>>   * the direction of the branch for the call is now inverted, so it
>>     chooses the not-taken direction more often. The issue-latency
>>     for not-taken branches is often cheaper.
>>
>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> ---
>>  kernel/auditsc.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> I generally dislike merging likely()/unlikely() additions to code
> paths that can have varying levels of performance depending on runtime
> configuration.

I think that's fair, and in this particular case the benchmark is quite
contrived.

But, just to elaborate a bit more on why that unlikely() clause made
sense to me: it seems to me that audit typically would be triggered for
control syscalls and the ratio between control and non-control ones
would be fairly lopsided.

Let me see if I can rewrite the conditional in a different way to get a
similar effect but I suspect that might be even more compiler dependent.

Also, let me run the audit-testsuite this time. Is there a good test
there that you would recommend that might serve as a more representative
workload?


Thanks
Ankur

> While I appreciate the work you are doing to improve
> audit performance, I don't think this is something I want to merge,
> I'm sorry.



>
>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>> index 533b087c3c02..bf26f47b5226 100644
>> --- a/kernel/auditsc.c
>> +++ b/kernel/auditsc.c
>> @@ -789,7 +789,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
>>         return AUDIT_STATE_BUILD;
>>  }
>>
>> -static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
>> +static bool audit_in_mask(const struct audit_krule *rule, unsigned long val)
>>  {
>>         int word, bit;
>>
>> @@ -850,12 +850,13 @@ static void audit_filter_syscall(struct task_struct *tsk,
>>
>>         rcu_read_lock();
>>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
>> -               if (audit_in_mask(&e->rule, major) &&
>> -                   audit_filter_rules(tsk, &e->rule, ctx, NULL,
>> -                                      &state, false)) {
>> -                       rcu_read_unlock();
>> -                       ctx->current_state = state;
>> -                       return;
>> +               if (unlikely(audit_in_mask(&e->rule, major))) {
>> +                       if (audit_filter_rules(tsk, &e->rule, ctx, NULL,
>> +                                              &state, false)) {
>> +                               rcu_read_unlock();
>> +                               ctx->current_state = state;
>> +                               return;
>> +                       }
>>                 }
>>         }
>>         rcu_read_unlock();
>> --
>> 2.31.1


--
ankur

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

