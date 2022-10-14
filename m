Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D95FF2A0
	for <lists+linux-audit@lfdr.de>; Fri, 14 Oct 2022 18:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665766440;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A6zjwHu8rpiZSPLdh9442dAjRlHRRiCjAkyVEA7J3mU=;
	b=TtG2mJk7yNZmAcHuz2s9B4VrwNJyksKTfTJNd5SYeXAFxlMr1XoTVkEtV8kYCsBuboVvQN
	lPF8pm3m6ryY/J3YBVKBqF2VInv2iJb+0Tia+9DpWDp5JXrSPQRtBI48GLNdiHlQm54KdP
	aARGpJnFiOnOswVG/MmyteyFwvUTDHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-3bjWrNREPou9NsbgOzVlbw-1; Fri, 14 Oct 2022 12:53:57 -0400
X-MC-Unique: 3bjWrNREPou9NsbgOzVlbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44E4101A52A;
	Fri, 14 Oct 2022 16:53:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7DEE4030C0;
	Fri, 14 Oct 2022 16:53:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F5BE19465A2;
	Fri, 14 Oct 2022 16:53:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5B8E1946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 16:53:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B6045C15BB3; Fri, 14 Oct 2022 16:53:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE1A7C47E1B
 for <linux-audit@redhat.com>; Fri, 14 Oct 2022 16:53:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D86B857D11
 for <linux-audit@redhat.com>; Fri, 14 Oct 2022 16:53:43 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-VvFRtFcXN4yJcFL8UYXaCg-1; Fri, 14 Oct 2022 12:53:27 -0400
X-MC-Unique: VvFRtFcXN4yJcFL8UYXaCg-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EGOFbP007182;
 Fri, 14 Oct 2022 16:53:25 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k795k0hf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 16:53:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29EFAriX003798; Fri, 14 Oct 2022 16:53:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yndx1ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 16:53:23 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 16:53:21 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::9d50:fa6c:853:c12]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::9d50:fa6c:853:c12%9]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 16:53:21 +0000
References: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
 <20221007004943.2910736-1-ankur.a.arora@oracle.com>
 <CAHC9VhSnWZ1ovEeajasBPQA0-_AgNW21K2Ycpc3wvSHw5uQZ9Q@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: unify
 audit_filter_{uring(),inode_name(),syscall()}
In-reply-to: <CAHC9VhSnWZ1ovEeajasBPQA0-_AgNW21K2Ycpc3wvSHw5uQZ9Q@mail.gmail.com>
Date: Fri, 14 Oct 2022 09:53:19 -0700
Message-ID: <87zgdyz6rk.fsf@oracle.com>
X-ClientProxiedBy: MW4PR04CA0315.namprd04.prod.outlook.com
 (2603:10b6:303:82::20) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d30ad3-557b-46f5-a7f9-08daae0499bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ENCZyJJtiEnkUxgL9kyK4iDxW4STn8UbbHt76T98Rpy53BA0E8I8bsUgjNamnGNpJAIAs/utYfipkjyZWAhqLJtv7vkMKRzyrMGjeeVjf2sSjTcgR/yQDpaqQ05r2ebwlMwASfpCsYKNk7v/ogXWEZrGdDWUEa9mvA5OmYDloYqRK0gYsg7RZbZY145KIa8yKBBYuuBFllG9qPJt58G0P0dZk06My4ISHSTGGmzEptl3+XZCbaBqKanXor9v51/ys/51WgCheNq0UY9QewIlIBI5Rq1+qDtMPKnzhmlp5bEOVcU+H9iDpaTCQlsmS16qi5HXgdduR166RRI63oWIV6ih0HO4MOUNdWvtTjOCECME/1opg7au5sDqGmOjpg7pqyw4wSxVGdB6qPJfJuATnnfv8lH+61iLOD4FQgeGxvH3OLPulNgJoXO5KSl+4hUw9jYBi6kO7kuDDHeBU+6W181kTnYySRNa8yETz6lrU1Zv/gEF/MFHom5EkKXcpw7Wm3g+iEnTOMF1Z34i+f3HS2W+tm+EOt6Ak+Vs0qwNfnDX5b4l97FfL4GRyY3RsLAAI3kZm/WrnnfSdhJxhO71enTgZxyXgrix/P+5WAeZW9K31EY6quElkMtSRRqHKDC6SeW2Ilf9TF+z3mmb6O0zFYAJKUsC65A/HUi/abP89Xc3GJtSvfdyM0xSVNjQevEY6wfH0bcKaRQnjVDchsFvPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(186003)(83380400001)(2616005)(38100700002)(5660300002)(41300700001)(2906002)(8676002)(8936002)(66946007)(26005)(6486002)(107886003)(6916009)(6512007)(53546011)(316002)(4326008)(66556008)(6506007)(478600001)(66476007)(36756003)(86362001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlXOp4e5WS6MuWYLs4WwO+fDnEVRyUAq+Roqygs3SwPtB/gsBGKTaB8mtFUZ?=
 =?us-ascii?Q?QJZFvPKK9fWzsM7BNeZAYTtjMMkwyNQQq4SFghPupxB9mO70l2aCEaOq/X17?=
 =?us-ascii?Q?SdbrMgFh2mjUCNeTgUk7bTL2YQkpgpPEwNt3FcJSdcrz81YV/uMqHqch83r6?=
 =?us-ascii?Q?fYHhXkxnZgGhU61zhIkV65zNeiSRFuvewF+mUYyGwQzRKh+3bqrISmKrnK3h?=
 =?us-ascii?Q?8paiI6PvJJqqceXyFlm2yAqW1J+wQl9b3YH8ugfOi1vSa9V+GMJ6t6qYXfE8?=
 =?us-ascii?Q?MMis8JXs5xVHGm2DMlhR0RW57CYrw38l4AlWRheG0Jt0XvWab8Mz7VIjPcpO?=
 =?us-ascii?Q?5WQ0gzaa66wDK0m9YVq+M+Eewj/u61CWP57N1HP2/RHv4iVn17FnsUB4V/ef?=
 =?us-ascii?Q?yzj+speg568JChM1Y+8rmGiZZPJGKLSW3MXcRE/USUGUushncaBab0YtBbks?=
 =?us-ascii?Q?BnPoxYJX/VXjSul2DR9UQkcgBGzNRl94ex5F3ZqHFLVaKB2f3xocygMFpi9E?=
 =?us-ascii?Q?r5W/u2Aq5KA20WBO7RXOOYr4qYkN/n8Ndnk2Q4vo0YoiKsVd2XuhMIavE9Z5?=
 =?us-ascii?Q?eDIIAwtomRj7+rYsKgGf/4VukPZnFf1nbIVzxmE57QnpEgWaTYJ2Qy+2ZKs/?=
 =?us-ascii?Q?xALBkiwQdTy8CyZxFB5pa8I9BX4NZbvprrUK+xW53AZCQlgP/tvGZ1QstlfE?=
 =?us-ascii?Q?fn7VeD7iCVZZiv3JwQ0tA9BqHRKOnpLS6xilnQhpXJn9xFjrmPHA86VnZjSp?=
 =?us-ascii?Q?j/FQ3dShAels8WZEPRkQ7mgTHp1QKOPwKFej0yxmfVzLRufs1pD/ntRPwhCm?=
 =?us-ascii?Q?2tlXy3XxJq4u6UmgKiKUpRxQpuJ6m6WBjwN0fy1/fQNToNmRY4SMMYsBPK6K?=
 =?us-ascii?Q?/501OrfBv538Ph539UXb+gFJV8haIOAI//cryOzFYJegR6O/gzQpM+c+KgRT?=
 =?us-ascii?Q?FbKzbG20Y+OWpFm2NIFqfCd3k0UbhNLD9MfNhNQToxvXifwMWPGvBGa1jOOX?=
 =?us-ascii?Q?YoxhHbJyXwABN3CJRTcPf6AB9WYa/V4eVwXDBwyWjgl5p9ktJmdgO2UM6VGB?=
 =?us-ascii?Q?437w09Gq9wiX8D/ts1M2OosLd2WW6JnLc1SzOsBaXat5mOiizQ/u1gti9x8n?=
 =?us-ascii?Q?i5mShrF89XRbgLhxTgtmTZNLpaxQkaj3fEZfHT9t9zYe2axrG84jtIWEJrjM?=
 =?us-ascii?Q?yQmJMnJtQyHISOOMrKWScGBJPWiNs8kf+So5BW77k7ELjYVSkVmjcpb99oHd?=
 =?us-ascii?Q?vhMbzPM4MUvKakGikmsxhtggxT9SQkPGqIau50rke2FScYTAHTqv5COtDOhT?=
 =?us-ascii?Q?JMPae5MpfC5MYPbuca5zTJkpJCn6zpHsOxoMXJ2GsE5/A+X8vEN8OKGwgKXb?=
 =?us-ascii?Q?eZosUPbgTBd7Lqr6qjCqWjzCVs+G8+LM8knRHfdE5yNk7/Auou9RNnuz+OAf?=
 =?us-ascii?Q?kEv7BsLFw52fhIx5lAKK99QDzPpRJ+Nf8OQJwer5CN1e3SjVsWGllzYrfsxw?=
 =?us-ascii?Q?KBjEvdx0//nWhBCF9FKtP1DfNSiXe1yb4I9qXFtBDMg5JUp/SdIC+WTXmPKk?=
 =?us-ascii?Q?v0hY4Z1hF+vemZh0im1YIiB1xAqUkfWgayjJ7YuE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d30ad3-557b-46f5-a7f9-08daae0499bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 16:53:21.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUct462jRWlTnziVWVYB8bijRZopQv49On4WoCc7RCUndBxNrfs07poFraHnAfHTJnECalHp3grXAOqNANRwRFr59lD12cyqWFBHftcl+QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_09,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140094
X-Proofpoint-GUID: eGntNJunOAWwJxSBATVpJWlO9l7M391e
X-Proofpoint-ORIG-GUID: eGntNJunOAWwJxSBATVpJWlO9l7M391e
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 linux-audit@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Paul Moore <paul@paul-moore.com> writes:

> On Thu, Oct 6, 2022 at 8:49 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>>
>> audit_filter_uring(), audit_filter_inode_name() are substantially
>> similar to audit_filter_syscall(). Move the core logic to
>> __audit_filter_op() which can be parametrized for all three.
>>
>> On a Skylakex system, getpid() latency (all results aggregated
>> across 12 boot cycles):
>>
>>          Min     Mean    Median   Max      pstdev
>>          (ns)    (ns)    (ns)     (ns)
>>
>>  -    196.63   207.86  206.60  230.98      (+- 3.92%)
>>  +    183.73   196.95  192.31  232.49      (+- 6.04%)
>>
>> Performance counter stats for 'bin/getpid' (3 runs) go from:
>>     cycles               805.58  (  +-  4.11% )
>>     instructions        1654.11  (  +-   .05% )
>>     IPC                    2.06  (  +-  3.39% )
>>     branches             430.02  (  +-   .05% )
>>     branch-misses          1.55  (  +-  7.09% )
>>     L1-dcache-loads      440.01  (  +-   .09% )
>>     L1-dcache-load-misses  9.05  (  +- 74.03% )
>> to:
>>     cycles               765.37  (  +-  6.66% )
>>     instructions        1677.07  (  +-  0.04% )
>>     IPC                    2.20  (  +-  5.90% )
>>     branches             431.10  (  +-  0.04% )
>>     branch-misses          1.60  (  +- 11.25% )
>>     L1-dcache-loads      521.04  (  +-  0.05% )
>>     L1-dcache-load-misses  6.92  (  +- 77.60% )
>>
>> (Both aggregated over 12 boot cycles.)
>>
>> The increased L1-dcache-loads are due to some intermediate values now
>> coming from the stack.
>>
>> The improvement in cycles is due to a slightly denser loop (the list
>> parameter in the list_for_each_entry_rcu() exit check now comes from
>> a register rather than a constant as before.)
>>
>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> ---
>>  kernel/auditsc.c | 76 +++++++++++++++++++++++++-----------------------
>>  1 file changed, 39 insertions(+), 37 deletions(-)
>
> Thanks, this looks good to me.  I'll queue this up for when the merge
> window closes.

Great. Thanks Paul.

--
ankur

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

