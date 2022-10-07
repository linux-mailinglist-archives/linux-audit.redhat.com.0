Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 256A75F725F
	for <lists+linux-audit@lfdr.de>; Fri,  7 Oct 2022 02:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665103813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=clkX6g4GT9iyZXyncS9rwGAns4qtLF8HO7EjoqdTXlQ=;
	b=W5ZRSjt6lDgeuOU/0m9UjQP8jeD306eKADFlnhd6oCyjVMGb2jUcQAzFIjKDUINcJQQM2o
	tHwqMURXJc4p78a6msayfbzazh1RhioPI04wxVxqY1da6IuH2KxJ2N5PAy62j068Jz1XGT
	TzzkQ7PUq23/MTT59je5TB9MZVURyn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-2JTMKwd9PFa1edeRazKG1g-1; Thu, 06 Oct 2022 20:50:09 -0400
X-MC-Unique: 2JTMKwd9PFa1edeRazKG1g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECE13811E81;
	Fri,  7 Oct 2022 00:50:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD3E45359A;
	Fri,  7 Oct 2022 00:49:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D3C81946A69;
	Fri,  7 Oct 2022 00:49:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CEA661946588 for <linux-audit@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 00:49:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9AE8405D4A6; Fri,  7 Oct 2022 00:49:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10F9404705D
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:49:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4F885A583
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:49:55 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-SaMXjrR4MBCER0AsDLBnOw-1; Thu, 06 Oct 2022 20:49:51 -0400
X-MC-Unique: SaMXjrR4MBCER0AsDLBnOw-1
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296NxWRB025143;
 Fri, 7 Oct 2022 00:49:49 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxe3tx3gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:49:49 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296M2NG2000537; Fri, 7 Oct 2022 00:49:48 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06axcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:49:48 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ0PR10MB4414.namprd10.prod.outlook.com (2603:10b6:a03:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 00:49:46 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5676.039; Fri, 7 Oct 2022
 00:49:46 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-audit@redhat.com
Subject: [PATCH v2] audit: unify audit_filter_{uring(), inode_name(),
 syscall()}
Date: Thu,  6 Oct 2022 17:49:43 -0700
Message-Id: <20221007004943.2910736-1-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
References: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ0PR10MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: aca8c84a-532d-470a-4591-08daa7fdd4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1RXp0AOwB9hZfFcINYs729WgswFbF3Zj50L5Wd0b28Zji0+sc3ivWaLl9PYUH5+GNrbq7EhF4ndvyV1iQ8gAiYFo7VhDphcYe8U0hPu3XxJC2vGu6WsoZACjjPXiEffOcF0s35ef+jyGRdqjf/YXXc6zDcL2nGRX0ukTNRezfYhO23DZjnfjbZdHAn5mEyBtuaCYm3GvqD4dj5ZviHQHihguHhVU15PKM49r8A222dboruOtoSCzkD/HX3+LlmpQZsVC3+ZoweWxULO0xFPfeBJ1kwS4suXZos9VUHouR0BHFDUB+VLJX0RGBPGIXGATpil1aXb8EHiV1vwpjb0uh8lLh/+ywCU4rM9L7lDEqpvITXdyQNgUdFzlPKZd/kMWmpwmIGwN0GblM4/tuMX+qVdYEi/CWFGsQJElW20xtvQfHUBD/1Zw/9sed6DXmS4neWN1G21QPhqSnxsLg77/ggR4lPlL6PX9XWVHOstPRxcTQ1bsZiBFWkwn50X7Guo5a5Py4T41YMjb6mv2eVi0/PUedFGpQESm4w7QK8XlScZaEfRuMxlhUHhRFFvb1mDB60myfl9kAWFhKjVpUppsEPY3RunX78UYoy1bhSDq7nPAa+kczE6aAnczeGtf4KZ+cDTti63BeT09D/WS5+WN4Npt381pf+YIvM27onWNGNPXRg1SLbfuU2E3XxbVbspAdHOZNKnCglk/KM+s1xshpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(36756003)(86362001)(186003)(103116003)(83380400001)(38100700002)(1076003)(2616005)(6512007)(26005)(6506007)(107886003)(6666004)(41300700001)(478600001)(2906002)(5660300002)(6916009)(316002)(66476007)(4326008)(6486002)(8676002)(66946007)(66556008)(8936002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XVStBiwHRXoU9IYKHIwjn8tEvWC2AnLEBJKQzhpQNOHKrZozN2UagdckjBBa?=
 =?us-ascii?Q?ag//zlz8Sy9gc4Z3B39nYTcHrFeKV5FTqNeQDnBqORUuiEBedwArMR8Rr25E?=
 =?us-ascii?Q?U+6y2xLR44DCzHqa1slzlpSJgbCEe2wPfVaEazUw1m1XjB+oZZkXtHS8sCZL?=
 =?us-ascii?Q?26wPWRa4hCf6Y/jst4ARupfwp8D8yBGevyGJNxjTpUt1kip2BhTwv2ewcTCK?=
 =?us-ascii?Q?U2K/Vamg8RN6CBZUMFUZFBf7CKV1/sABUxN1vcSCGJzvixwhL3mbzJifkkCZ?=
 =?us-ascii?Q?UWERou0UpxXcmSu9xwjiXIjeGYrZa624804YRxNTa2u1MQixsk8iX/2oTV0t?=
 =?us-ascii?Q?F1gJaApDVu1ESLsrjJYP7O12tMx5L62QDWqsakoo53h53ssd+uVgGGRKXafC?=
 =?us-ascii?Q?3r8XNeu9IsTuCKfjHHSU+q/xtVoVzcF2M5R7hX4gubco8u3xzo6mHUfuE+uT?=
 =?us-ascii?Q?5SYyANrPedp235GhZ6ec5mFaYy7dLHL1n8TIG0GqXcENKqiwMkD88wRX3iiv?=
 =?us-ascii?Q?KeBIIO6E+gYf39pFiuKAyQ+48FBjQPbqv8BMlTbEsE+qZBGVkgC8IYGkud7g?=
 =?us-ascii?Q?CMfOEZIdkQbG6xPyNEYg1l3k753y7vSobA5jKwnfGMgFDIlSVx5EniaaBPUs?=
 =?us-ascii?Q?Vu4TzQhQaOiaa8eGcmY7HO95VV6TQlrpuFAJmfAmsvjkjqNld95x4CYCAodL?=
 =?us-ascii?Q?rrTf7k6nbftj9ot9W+0lKeWtAycumC3xTcpI4uEGCSqXm1znwhPlc2Z8p/Is?=
 =?us-ascii?Q?dspMFjDpxrEWyQSpogBzZxCiq1v2JnC3XsMo4TBUNPvUnj1wVLl1UAY+1K6P?=
 =?us-ascii?Q?JqUSuMaPvhyjnV66jMZ1a+TbY+7wf76fji4qZkschh5VEM+kEN3aprLwh2T5?=
 =?us-ascii?Q?bRXb/oXA3AvfxLQJln2aqkZpUeozVuLN4Bcf5aleROVC21WvYAzB49A93nWu?=
 =?us-ascii?Q?ZECZ/B5UUH+uI38J5r9sJ5iEsVDA3M8th7qZuuEA7rDHBd8OihZsvct6iVJZ?=
 =?us-ascii?Q?NPI/j4Afy4+aGEPNJV0p/o8fGEJMj8sWteDmmKS1IQQxq106fMJEwkHruU7u?=
 =?us-ascii?Q?FiWZYN/W4u84D5ac/Hlrrq0a/L2SlN1cjmPUbQnaWr4GZmHHngWTK0VpJIzq?=
 =?us-ascii?Q?1CzHVC7NqeGE1sSIPNoy6vKcxXV1ea+Xp/sBfoxy1iPCMo8rw6XiZhDamh1v?=
 =?us-ascii?Q?zRuROB0O5bTZg7qqT0XSbdyxNtPl0EqUtGgN+9n0asS59zXk+MvfFyEdo89D?=
 =?us-ascii?Q?FZXH0w6OcUeMaawge5YxPtpq9d2Wc4zhPQ5D75LzmGYrAS8rhPeCMc9pfPVh?=
 =?us-ascii?Q?ac7Sd7lVdYVOYcRIDAWNkSZwd8a4B5u2OnIXUGDKR53SMXQ4qv6A0pK0dtyT?=
 =?us-ascii?Q?xhlOE0NYg7M9POhTZDapI2SSARTrj9j7Czzdo1Il2XVPK2BAlHs6w71FYdCz?=
 =?us-ascii?Q?HhgQJus5kQG/qY7TI0lm+QQe0oeY0VzPu7tkeHDmEXSL038YrMXf9YCYcsT7?=
 =?us-ascii?Q?F1cq5yrR4RPSSgPv/WppSF+EEkzfPiJv0hNfNoW+MNwWGTFb+g1BqC9Xm0HK?=
 =?us-ascii?Q?G6OtVpWSScNG0WyiK3RO88jj1/pzyLUtDFpiExrrBO1jqMPUHwkDfzJxaj8D?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UXb9d4A7fGDjoXUPaTzjmjXdusIgr+MtGwy+6VmLd2810l+WhDlBa5oedtWkbDAvxGwoXgnACGuMo3PIJBFMRuYY2RQuWALjvhqcsYq5JFK5IjEO3fFGYrxq8F9ISiCgAoihrA7s/E0ihMRiAYw8U44CXyHhXcybdYWk0P1gL0BggFGKb5mPt568N2gHCuLfRoJGJcyX9JJCUseCI6hRpZvGWPcECXgmOJLlW5nigpm5d3MpsDoplSv/pINRYD6PhLIPtpq4vSLZv+EwPqp7T4WoN7H+dQ1Pe10G8UMNYfuoosN62lAXGaKJKDwsz0PL/QeQKxwhEyKbA2TDhGCUaO6CGxW0Lc3X7zEslqQf0kcRlkry46bbOUEvY0kdi7IBDmvG6lcgvBZe0utBrSmaaXoxvn5IVK6lFLo3W2BGX9sHlC/34eOGD4gRIb0pnsdg2SGXXXGjqzLO3rEUCmH6RMRQq75K8LwQuxUaQGdre8ML5cbFzyCiEfui0L5aGqLk+pUmH1ZXUBVwVoB0vas1DQ4w7UYL4HHvGIaokUVQosM/ZhKHR8YR/Z4zxwTjIw+VbfZxSIBTmjRegkVxOzwcqoW6qVkhTK2r5NQWxMr8oB+e0cmZouZVfXyUAyVTO5vJ4YQJQ7q2FOuTkorycruxk5CR81aHqT8R8TCWF8Sm090KDBOXF+ll5w+uRbWsamVISf0Ar1jFxm41WamXYJqglMFxnJfthk7NNvMJQGIATvm7N5Js/ORtOZhbSIxg7ERgN2SQuTPDeqyFhxfXsuKVYqygIBPbCzYNrIbtzRInegfXPexwihBcDP9dd90MF6BTx0ZVapp5qLw9e++Xs5oBgVbwl3EQPiNVuRDeKDHH7uhvXgDWRTrrf6iP+svSeIBmwglRZJAyzmhxH2rSnM29Bg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8c84a-532d-470a-4591-08daa7fdd4b2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 00:49:46.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiL5Nkmb98aDEuPY54pgBFkkpXv3bVJTC9HRsHv4tNvcrqohe8tMtUaLQlYawfmR/gSLUvLlllKwvMolHsgTZpsa8H9qpQBpNgZkmjd5+GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4414
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070003
X-Proofpoint-ORIG-GUID: fw3UxltV4GfzV15JDIsYgINTf6XuTFb4
X-Proofpoint-GUID: fw3UxltV4GfzV15JDIsYgINTf6XuTFb4
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

audit_filter_uring(), audit_filter_inode_name() are substantially
similar to audit_filter_syscall(). Move the core logic to
__audit_filter_op() which can be parametrized for all three.

On a Skylakex system, getpid() latency (all results aggregated
across 12 boot cycles):

         Min     Mean    Median   Max      pstdev
         (ns)    (ns)    (ns)     (ns)

 -    196.63   207.86  206.60  230.98      (+- 3.92%)
 +    183.73   196.95  192.31  232.49	   (+- 6.04%)

Performance counter stats for 'bin/getpid' (3 runs) go from:
    cycles               805.58  (  +-  4.11% )
    instructions        1654.11  (  +-   .05% )
    IPC                    2.06  (  +-  3.39% )
    branches             430.02  (  +-   .05% )
    branch-misses          1.55  (  +-  7.09% )
    L1-dcache-loads      440.01  (  +-   .09% )
    L1-dcache-load-misses  9.05  (  +- 74.03% )
to:
    cycles		 765.37  (  +-  6.66% )
    instructions        1677.07  (  +-  0.04% )
    IPC		           2.20  (  +-  5.90% )
    branches	         431.10  (  +-  0.04% )
    branch-misses	   1.60  (  +- 11.25% )
    L1-dcache-loads	 521.04  (  +-  0.05% )
    L1-dcache-load-misses  6.92  (  +- 77.60% )

(Both aggregated over 12 boot cycles.)

The increased L1-dcache-loads are due to some intermediate values now
coming from the stack.

The improvement in cycles is due to a slightly denser loop (the list
parameter in the list_for_each_entry_rcu() exit check now comes from
a register rather than a constant as before.)

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 kernel/auditsc.c | 76 +++++++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 2206cdf1ba2c..4991348e300a 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -807,6 +807,40 @@ static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
 	return rule->mask[word] & bit;
 }
 
+/**
+ * __audit_filter_op - common filter helper for operations (syscall/uring/etc)
+ * @tsk: associated task
+ * @ctx: audit context
+ * @list: audit filter list
+ * @name: audit_name (can be NULL)
+ * @op: current syscall/uring_op
+ *
+ * Run the udit filters specified in @list against @tsk using @ctx,
+ * @name, and @op, as necessary; the caller is responsible for ensuring
+ * that the call is made while the RCU read lock is held. The @name
+ * parameter can be NULL, but all others must be specified.
+ * Returns 1/true if the filter finds a match, 0/false if none are found.
+ */
+static int __audit_filter_op(struct task_struct *tsk,
+			   struct audit_context *ctx,
+			   struct list_head *list,
+			   struct audit_names *name,
+			   unsigned long op)
+{
+	struct audit_entry *e;
+	enum audit_state state;
+
+	list_for_each_entry_rcu(e, list, list) {
+		if (audit_in_mask(&e->rule, op) &&
+		    audit_filter_rules(tsk, &e->rule, ctx, name,
+				       &state, false)) {
+			ctx->current_state = state;
+			return 1;
+		}
+	}
+	return 0;
+}
+
 /**
  * audit_filter_uring - apply filters to an io_uring operation
  * @tsk: associated task
@@ -815,23 +849,12 @@ static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
 static void audit_filter_uring(struct task_struct *tsk,
 			       struct audit_context *ctx)
 {
-	struct audit_entry *e;
-	enum audit_state state;
-
 	if (auditd_test_task(tsk))
 		return;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_URING_EXIT],
-				list) {
-		if (audit_in_mask(&e->rule, ctx->uring_op) &&
-		    audit_filter_rules(tsk, &e->rule, ctx, NULL, &state,
-				       false)) {
-			rcu_read_unlock();
-			ctx->current_state = state;
-			return;
-		}
-	}
+	__audit_filter_op(tsk, ctx, &audit_filter_list[AUDIT_FILTER_URING_EXIT],
+			NULL, ctx->uring_op);
 	rcu_read_unlock();
 }
 
@@ -843,25 +866,13 @@ static void audit_filter_uring(struct task_struct *tsk,
 static void audit_filter_syscall(struct task_struct *tsk,
 				 struct audit_context *ctx)
 {
-	struct audit_entry *e;
-	enum audit_state state;
-	unsigned long major = ctx->major;
-
 	if (auditd_test_task(tsk))
 		return;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
-		if (audit_in_mask(&e->rule, major) &&
-		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
-				       &state, false)) {
-			rcu_read_unlock();
-			ctx->current_state = state;
-			return;
-		}
-	}
+	__audit_filter_op(tsk, ctx, &audit_filter_list[AUDIT_FILTER_EXIT],
+			NULL, ctx->major);
 	rcu_read_unlock();
-	return;
 }
 
 /*
@@ -873,17 +884,8 @@ static int audit_filter_inode_name(struct task_struct *tsk,
 				   struct audit_context *ctx) {
 	int h = audit_hash_ino((u32)n->ino);
 	struct list_head *list = &audit_inode_hash[h];
-	struct audit_entry *e;
-	enum audit_state state;
 
-	list_for_each_entry_rcu(e, list, list) {
-		if (audit_in_mask(&e->rule, ctx->major) &&
-		    audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
-			ctx->current_state = state;
-			return 1;
-		}
-	}
-	return 0;
+	return __audit_filter_op(tsk, ctx, list, n, ctx->major);
 }
 
 /* At syscall exit time, this filter is called if any audit_names have been
-- 
2.31.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

