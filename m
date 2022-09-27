Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E15EDE3E
	for <lists+linux-audit@lfdr.de>; Wed, 28 Sep 2022 15:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664373342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VQS7WVTRnMewWZk80ivdhUux0kiPKe9YWDTJk1XF0u8=;
	b=BR3iuDN5RSkHJI2KEERm79zYtSoX5gAmw50pNrMXKj386Sh3I9+WEAtbWwKlHjcyXBeiJ6
	6rC4I0hb83UfLCQF3YRexcczoUM9ba2hP/c/Hl66Vqeh6x4cfVJEvICbICK/Dg7hSSlxma
	Ik162vOHHpZdcMXPSXQ2RnD0W2Yjqg0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-CCkylDqIMnW8NXygM-Jj9Q-1; Wed, 28 Sep 2022 09:55:40 -0400
X-MC-Unique: CCkylDqIMnW8NXygM-Jj9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DACA1C05AA9;
	Wed, 28 Sep 2022 13:55:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D33711400E43;
	Wed, 28 Sep 2022 13:55:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BD801946A4C;
	Wed, 28 Sep 2022 13:55:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7F821946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 23:51:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6547049BB62; Tue, 27 Sep 2022 23:51:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C6B249BB60
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 23:51:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA43801231
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 23:51:27 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-pa7t-k9rO26KAOwG2dES1A-1; Tue, 27 Sep 2022 19:51:25 -0400
X-MC-Unique: pa7t-k9rO26KAOwG2dES1A-1
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RK7neZ009576;
 Tue, 27 Sep 2022 22:59:53 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jstet0dp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 22:59:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28RLXSrZ001509; Tue, 27 Sep 2022 22:59:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpv0ypj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 22:59:52 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB6900.namprd10.prod.outlook.com (2603:10b6:208:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 22:59:50 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 22:59:50 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-audit@redhat.com
Subject: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
Date: Tue, 27 Sep 2022 15:59:42 -0700
Message-Id: <20220927225944.2254360-2-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 02edfc00-299a-4e36-8df9-08daa0dbfb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: svPZW8ZK4pphn6dXZm1sr8mVVW1CKQoTP8V9b+RLhAr3AQCNtn31aqfaM9gU2SSSD09rKVCgFxxMIxv4hdb5eQEe+Ty7oobwdBVis4c0LQJkmee9X7QoBL8t/k1QIAwggKPLXOtlceFCiV9UnI6RATayNIqnQLSOonfgfd0c3OnBIGoe5vOnjicBwLPlOhNkKOg+BQoJ9xlUaq9Fayp9lA+pgHyzh9xYAfW0qkJFLzT00j2LPYfbND18cmX7Bq4pQg0DjZtXtZUrVLdTkuxjKe1uvgPROB8N0jf64Z/l9eyz29SatXYhUruYrJsFmmzUjvQyRT6wwNxElXOz59Zxj5UFNpBQAONae7k73k2NkVqW5YL/cIW/CRfOCdiCpq+2tUt5dU9goTLM3mF434p4pck7M+bdNYSOvpOs4M2MfObCkqqTutfdlgzFaX7aEXLyoXJsXTlhK6vLP18oA0G4EAQrHnBYuurXciA+gAIGSrSZqPxi2NYI+lE/UAAUtOmSlIOsIA1OZFdtk1fvr4/bzLHz6YaKf9B8tfkHr1rSaFGzizXFQNo9Es7dm9IGK9wiN6MPrlYhLkcYuFzkHGySjUi7LHLt/qMbi5MvG6ZBB8v/n5Egw1164RGu1xU8DzrauNXaIdsP1NuvzVT5H/bgZpebHUrXq9nKgLKGFkN8+ZtSmzpa6QFLU5/81B6bLz5R6WZcVBkkjgQ2Pqw3p2gYAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(1076003)(103116003)(2616005)(186003)(86362001)(38100700002)(83380400001)(5660300002)(66946007)(66476007)(41300700001)(4326008)(8676002)(66556008)(2906002)(26005)(107886003)(6666004)(6916009)(6506007)(316002)(8936002)(6512007)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iP/C9KkuEURBtqImkpoRmEeYIigXSl1xqkYPwyGc+mCrmvBkuGeN3kglUPfw?=
 =?us-ascii?Q?ObsNPrsY/iNgBPOCSieS60Y/t1jRuK/6KooHLWy1lVtNPoH6/res8K7EaxHT?=
 =?us-ascii?Q?akJONTkg6o8ivkXnZqH8GNAY8rHfhYsJxq0xz4NbSgwWoC+EqfiTIhksxysK?=
 =?us-ascii?Q?oxbEhnbbvHQK6+4iSDFb/rUocScR0CBa5KghscdCAlvoSqj9g+QCAakDhJhX?=
 =?us-ascii?Q?x7RU33dO1ICcyGPN+IlF3UsVLseDuRAPDxfU1dDza1/rmoetUG2N8WqLRq8q?=
 =?us-ascii?Q?DIK7HaYZU4j2iMLwqO9RSdHKAfmhNTcNfeuH5otxjuGyjglRNQVi+K/hCFWX?=
 =?us-ascii?Q?gNDb2CdtOv+cI82G/ACUcN8loAvrj7CNtYGMK4sZSN9qy/DQ42z6tU1oyQR5?=
 =?us-ascii?Q?j3vuN8uHv+Ni5yz2hcHF4N1/sHAQjz3efOjxlPmvtjhtnabcdpXSrgs8MqFH?=
 =?us-ascii?Q?QWn/LjvKkxYVJY18OiMhw9KgKJJdKFoXE/7Yav2V2vG8/pkTNvsQl+8osSYg?=
 =?us-ascii?Q?HZrODrWicqWAEXvAHMnpTsyw80BNjqDLbxPl/9ANLumXzfKrZnheMWaTGykR?=
 =?us-ascii?Q?dzc4WJVbvXgttHUrGO6NehQJxwZbpDu8eYH8mM/IZNblQoefpxrkOwnsDcmv?=
 =?us-ascii?Q?Zd9mkBIchBaOivPvxwSncgE0WmCdOlLSkXstxPkHvcohKsWWa0drwWywxlJA?=
 =?us-ascii?Q?cjQErUzHxd82yHgumcWS/dORPZQAQyfFDmRzcPbGJiR7NT7LYytbPP3MYXR3?=
 =?us-ascii?Q?DEvkK24RywB/YdfPqi++hDz2DaJw1AN7S8LRZ1mn1X+hRkraunnTo8Y3HWvc?=
 =?us-ascii?Q?dXEmrZWXNc8j/QASB6hsMyjsmNtdwZ5rpoWxZfBQTkyXLcgNyvvs9q4huOl4?=
 =?us-ascii?Q?c85vEqeUOo+8iqWOUKwwZ+kmmiCDVoT1HqM84UkEccfAgzlI6cix2eKJyqpX?=
 =?us-ascii?Q?6QqR9DYrT0E2vIpWpZxaxFJEJMgWty4pfkAnfZ4j23d93mySipQmQ5a8tX8C?=
 =?us-ascii?Q?KCr5KMSQ7cieOFA5PO/WoRi5R+KyiAKlRY+RdG0JSL6FA/5TDnUOdRMFylW8?=
 =?us-ascii?Q?q1Czi41yNFj7H4bkHPBBjEYsasT/hgdT1jI8cGc7YquMvUu5l1E/FmTSPFXc?=
 =?us-ascii?Q?/bpkpUShRb9uQLZGW8fTMxh2vSTPciSVs3X/A740qU6TrRyKbTOonB64J3dH?=
 =?us-ascii?Q?HxY1uvovyYlpIQG7d3AVoWtuNGMJ16Y72elAIAjossVi0f2RxwOklTgCtzzA?=
 =?us-ascii?Q?9DWEl/tXJuEXTe71aaiYKwSwr2weLQN0JQ5rEH5KtnLV8jFckh909ufMxFYY?=
 =?us-ascii?Q?TJTqFMSKeAS0ydDznPEuanm5Wvp4bVPTrgPh6xs22zaMQfXu0iEcIaayqgfD?=
 =?us-ascii?Q?uFkga8grQEUbBHT9fjFZOhL573aIStZBV3CUTp5M9SUNmCBJMIOy4D6X7eCa?=
 =?us-ascii?Q?i13z7kZfqDTcat5vS6GPz0Ej7oMCKkZLVyvDw8+yFHlS38Kfttug6UdjgbNk?=
 =?us-ascii?Q?jkWgTtLr5GsGqN48IgQMAk3Z6GHIsemAMNolP2UBot07Bl5pewno49KyDtDA?=
 =?us-ascii?Q?y/irGctl4LfMQd/u5q1KlziFgA0cdjIoxg5YRB9b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02edfc00-299a-4e36-8df9-08daa0dbfb3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 22:59:50.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnvaNTb8VJVHySWTM8JFNeC3udiluiuZbYZnSvXS0Vh47YPOZDJhj3rf4EuJTOJi53/DX3w5LY+fLnU4pEoVmlj4Obwm/6GiP1I6CIU3MjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6900
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_11,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270141
X-Proofpoint-GUID: YadM-UBAUlDams3bmhQCuWEfI876zcnj
X-Proofpoint-ORIG-GUID: YadM-UBAUlDams3bmhQCuWEfI876zcnj
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Wed, 28 Sep 2022 13:28:25 +0000
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
Cc: boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, eparis@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ctx->major contains the current syscall number. This is, of course, a
constant for the duration of the syscall. Unfortunately, GCC's alias
analysis cannot prove that it is not modified via a pointer in the
audit_filter_syscall() loop, and so always loads it from memory.

In and of itself the load isn't very expensive (ops dependent on the
ctx->major load are only used to determine the direction of control flow
and have short dependence chains and, in any case the related branches
get predicted perfectly in the fastpath) but still cache ctx->major
in a local for two reasons:

* ctx->major is in the first cacheline of struct audit_context and has
  similar alignment as audit_entry::list audit_entry. For cases
  with a lot of audit rules, doing this reduces one source of contention
  from a potentially busy cache-set.

* audit_in_mask() (called in the hot loop in audit_filter_syscall())
  does cast manipulation and error checking on ctx->major:

     audit_in_mask(const struct audit_krule *rule, unsigned long val):
             if (val > 0xffffffff)
                     return false;

             word = AUDIT_WORD(val);
             if (word >= AUDIT_BITMASK_SIZE)
                     return false;

             bit = AUDIT_BIT(val);

             return rule->mask[word] & bit;

  The clauses related to the rule need to be evaluated in the loop, but
  the rest is unnecessarily re-evaluated for every loop iteration.
  (Note, however, that most of these are cheap ALU ops and the branches
   are perfectly predicted. However, see discussion on cycles
   improvement below for more on why it is still worth hoisting.)

On a Skylakex system change in getpid() latency (aggregated over
12 boot cycles):

             Min     Mean  Median     Max       pstdev
            (ns)     (ns)    (ns)    (ns)

 -        201.30   216.14  216.22  228.46      (+- 1.45%)
 +        196.63   207.86  206.60  230.98      (+- 3.92%)

Performance counter stats for 'bin/getpid' (3 runs) go from:
    cycles               836.89  (  +-   .80% )
    instructions        2000.19  (  +-   .03% )
    IPC                    2.39  (  +-   .83% )
    branches             430.14  (  +-   .03% )
    branch-misses          1.48  (  +-  3.37% )
    L1-dcache-loads      471.11  (  +-   .05% )
    L1-dcache-load-misses  7.62  (  +- 46.98% )

 to:
    cycles               805.58  (  +-  4.11% )
    instructions        1654.11  (  +-   .05% )
    IPC                    2.06  (  +-  3.39% )
    branches             430.02  (  +-   .05% )
    branch-misses          1.55  (  +-  7.09% )
    L1-dcache-loads      440.01  (  +-   .09% )
    L1-dcache-load-misses  9.05  (  +- 74.03% )

(Both aggregated over 12 boot cycles.)

instructions: we reduce around 8 instructions/iteration because some of
the computation is now hoisted out of the loop (branch count does not
change because GCC, for reasons unclear, only hoists the computations
while keeping the basic-blocks.)

cycles: improve by about 5% (in aggregate and looking at individual run
numbers.) This is likely because we now waste fewer pipeline resources
on unnecessary instructions which allows the control flow to
speculatively execute further ahead shortening the execution of the loop
a little. The final gating factor on the performance of this loop
remains the long dependence chain due to the linked-list load.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 kernel/auditsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 79a5da1bc5bb..533b087c3c02 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -843,13 +843,14 @@ static void audit_filter_syscall(struct task_struct *tsk,
 {
 	struct audit_entry *e;
 	enum audit_state state;
+	unsigned long major = ctx->major;
 
 	if (auditd_test_task(tsk))
 		return;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
-		if (audit_in_mask(&e->rule, ctx->major) &&
+		if (audit_in_mask(&e->rule, major) &&
 		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
 				       &state, false)) {
 			rcu_read_unlock();
-- 
2.31.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

