Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47C5EDDC3
	for <lists+linux-audit@lfdr.de>; Wed, 28 Sep 2022 15:34:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664372067;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XqqkXdhHITOMOAh8jqChGLb6AOppLrwZtgZlOUInB7k=;
	b=S4PCR33d32QlMb8be5b6NahHTa+/MBIVIpSkX3W5rNbK6Mo65YuXYtmXZ+1OMSo5un2gLV
	yllEZonHv/YNAUyOufxqNU9GlVMqiteV5whsgqxg7rpvnFbgMfsVRrAP6ViEJg1RBKmMjU
	vqxG++5UnAHjASB4J9BGzoxYg2xdLhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-K5B90yQvOhmO_YifvKc7gQ-1; Wed, 28 Sep 2022 09:34:23 -0400
X-MC-Unique: K5B90yQvOhmO_YifvKc7gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83E7B101AA79;
	Wed, 28 Sep 2022 13:34:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AAC8200D8C2;
	Wed, 28 Sep 2022 13:34:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 766311946A4C;
	Wed, 28 Sep 2022 13:34:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2737D1946586 for <linux-audit@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 00:18:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE6691121315; Wed, 28 Sep 2022 00:18:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C71D71121314
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 00:18:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94FD5802801
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 00:18:13 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-NL3ogjguNHqslwh8o9WhyA-1; Tue, 27 Sep 2022 20:18:10 -0400
X-MC-Unique: NL3ogjguNHqslwh8o9WhyA-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RK4N1L026979;
 Tue, 27 Sep 2022 23:00:02 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jsstpqxt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 23:00:01 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28RLS3xj002590; Tue, 27 Sep 2022 23:00:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpruqg3v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 23:00:00 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB6900.namprd10.prod.outlook.com (2603:10b6:208:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 22:59:55 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 22:59:55 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-audit@redhat.com
Subject: [PATCH 3/3] audit: unify audit_filter_{uring(), inode_name(),
 syscall()}
Date: Tue, 27 Sep 2022 15:59:44 -0700
Message-Id: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 57396e2b-a3f1-405c-a402-08daa0dbfe4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: kZxmMUNGCIfbSGhxXu/Gknz7DhmZ7ZjRktJrrudOwwQEO4WDaCe7P9IV/d46R/HgAbZp3xl5GQe0xNuhI8SApWHDlFPuOzKLwid7Kty4b9HgZVK1BFZmM1DW5AhE7oVY8XNpBRkNnhPM9JGlSQdB3DRH21R69sJsfY5lDYuRJU6vYRHVMRFdgGieQaM7mkPbphiq8LJBOmDeBpvqr5YoFoHjL3eC8vn3E7rC/ORd4wTj3oXm9+/s5ctdarYxzGuwwuP/eN0lCwUj2a1AUne2NhaDiFawRb9d1rYoqTO6TvET0X3cPLeU76HYl5cMS9Kfy9PXNeJLEcLfo+QHp+WtW9Mr1qt7LdTIVodFO7c9fxpAGZiRo3FOMb9Vkyu4PuH9aL0Grmr+cm+Fh3xdup7pZCzjORQSQn971f9Wp3gzukhTnJnEp9fOWagU3Jv8/UDmVgQGfU//ySAj7k+d+BGhNS2e2LrhVSGyhrViI/UIZ7q0GluUBOjPwsw6AD+3qGPwMOofLLS25Ql3aIJ6pKf9StSK86V9dsc0sJ3jUlYmq/xyjLWgT6l6yEwAx8R9IpdrBSLJvBY0rjyr4w2PnE2CpIFbqi+xXzDlEpydNBj1PLlz6YFEIH9JsYURS2FFSZizESZMdJv9ZWlCroyo9q+QWBobFsV2UrcBJdAa+mYXyFfc9xjTI0aJeV6Y0zLSmfXC6KmtWuG6wM+2X2gIBKG/qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(1076003)(103116003)(2616005)(186003)(86362001)(38100700002)(83380400001)(5660300002)(66946007)(66476007)(41300700001)(4326008)(8676002)(66556008)(2906002)(26005)(107886003)(6666004)(6916009)(6506007)(316002)(8936002)(6512007)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRp7nV6mZNFToy0/CNRNisjauemq1ena0YKDCWhAnSCpQiSV1gQ6+nEmB6/i?=
 =?us-ascii?Q?Ey1RyK9QueWcYkSwjEllnksgyYoCZMOKZDs0i1U4eAYS/7warjUdP+91D9na?=
 =?us-ascii?Q?ZDhcTwBNS/uZYcdYbkneqQ1EMwUEaRCTk5Rnz1VLpAlfk7oTiYsYRxnvgIMA?=
 =?us-ascii?Q?00R9t48nABDgQJZOBSl9zNK0WKngQdoQjainJy3m1IZ79/NhAjJ0vD1ovt3Y?=
 =?us-ascii?Q?BDwSMLlad6Jtki/H1g7CzU+VFEJxmkaSQ9zAdPdKS2+al9IfkZuPOf++YS04?=
 =?us-ascii?Q?cJw5SoDB6zisACfja6haZ9jXI6/A6QAEtiU2zF25O7Hty70lKzAgyhL5VDpg?=
 =?us-ascii?Q?nAXLpKgacV2wGlhN3t0w6d32yzOBmIOgF50/Y3MvQKfkyJVul8WE/ynDkrU9?=
 =?us-ascii?Q?GfyIJqioeXFyBZwz4ToLC7YkSLpE3s7IUng0ZFq3F5MDZNX5DA4b5u/ncGsT?=
 =?us-ascii?Q?lUvYTE+oXTVKKQG333faBCCl70BJ9I0uk6iHpjgbxWXMxoJD2a38fSl0HSlh?=
 =?us-ascii?Q?2BLqjnB1Nkftwj93Ro6SC8Q7tTcl9rUBkEO316tKUqzmJvIWEupAdXP5Lb6J?=
 =?us-ascii?Q?t/LfMeixBks2ZXETl3flFwCczgbIv8uf10jN2EcnB7EQpZcUfJvKAaUcpVfY?=
 =?us-ascii?Q?p6ZiL9myEA/kz4vXIxM+US1GC6geBZPHkKrzICpDmjjOIb+EL5MplwsJtf+L?=
 =?us-ascii?Q?od/DffeGo2nzzYpcLKW7xysDlXIo895+aMWs5MIqEbeOvQI2IKtay6hyAeOf?=
 =?us-ascii?Q?qC9/svBjcCj7eL0DU+sDtNRH6IPAKWwTZD4CT1M9VrbvnDMFA+ogTlqp6/OR?=
 =?us-ascii?Q?OLmeb2Ud7yp6RSkw2AATQ5BJ1BNAfsW7WODJ6dUT0fc10SEWLvrf9A+c5Rfg?=
 =?us-ascii?Q?/6UmQUkYEr2vL6Pp/xN0oZduszCItapvcpSpzYCr03qXee2O8w+Fvwxyj6KQ?=
 =?us-ascii?Q?V2K1U1ZGlSeaIURpJEba929U0hsGMkLfT4QYnAFa32Ye1CCIOSEBtaCleRlX?=
 =?us-ascii?Q?sm+tECHh5UXK+HJqaBLjMEKqiaeUYrMXQ8av73CtbyyhOLUs9YU6pGkEOFG2?=
 =?us-ascii?Q?QklyC1MCtbM/F18lt+z3CV7PIY4m7c2OVwJt9/Ls6fUDXU6Pgs4lnktO5u+n?=
 =?us-ascii?Q?sRi0FXa7FCP+f1rCJO3cYxfIWo9pHW55OLhKkj/7eadRwTcIdQItRK6r4VW6?=
 =?us-ascii?Q?IlhGxZw2HziumKgkpkjO0CikOan1RHwSVccuoqBFb3CeI6SF3qSgTL9r6Jop?=
 =?us-ascii?Q?9TfW1HND6EPzl4XEaCv3Y6JsEnFeFUM0cp6X18An3rKTB/uUFpz/ZZdEWixZ?=
 =?us-ascii?Q?nu+s++d5Q3cCAAMjIyMweh7Waj9AUlocHQnsA+sp5F6XKwH1yZVppBoNTatq?=
 =?us-ascii?Q?aideaJAY7Ughe7eqq5gd6aHy7Mzf3ywOybwdwpCgCPswcTKXIavqfqUGuiWX?=
 =?us-ascii?Q?l5SLT+OP3Ot6xTHE9rggOTIkFMtFCM1Rq/KjNMty567QqT4cR/TaMu8pR13q?=
 =?us-ascii?Q?x7nK23AhkzDgsi8fQpeqMzyiGj+cmkKgt/HF03j7E7ckcAQAQPIGFKZ8UHZc?=
 =?us-ascii?Q?aUdqWeQ/8iFk3vjuQ8tISTKXySDgcxqv7tfzlcG4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57396e2b-a3f1-405c-a402-08daa0dbfe4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 22:59:55.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjWAobYO+WhzXOyi1G5tva712tIOITRz609oWOxaoPu+hk4DV7LQ3tbikanKLeM8NYodJqej8AzljXGv6tSvYgUG9CAPUUjpXB5b67UFxgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6900
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_11,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270141
X-Proofpoint-ORIG-GUID: tqvi48CRmi8Ed9jN-S_2keNs323j4jeW
X-Proofpoint-GUID: tqvi48CRmi8Ed9jN-S_2keNs323j4jeW
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

audit_filter_uring(), audit_filter_inode_name() are substantially similar
to audit_filter_syscall(). Move the core logic to __audit_filter() which
can be parametrized for all three.

On a Skylakex system, getpid() latency (all results aggregated
across 12 boot cycles):

         Min     Mean    Median   Max      pstdev
         (ns)    (ns)    (ns)     (ns)

 -    173.11   182.51  179.65  202.09     (+- 4.34%)
 +    162.11   175.26  173.71  190.56     (+- 4.33%)

Performance counter stats for 'bin/getpid' (3 runs) go from:
    cycles               706.13  (  +-  4.13% )
    instructions        1654.70  (  +-   .06% )
    IPC                    2.35  (  +-  4.25% )
    branches             430.99  (  +-   .06% )
    branch-misses          0.50  (  +-  2.00% )
    L1-dcache-loads      440.02  (  +-   .07% )
    L1-dcache-load-misses  5.22  (  +- 82.75% )

 to:
    cycles               678.79  (  +-  4.22% )
    instructions        1657.79  (  +-   .05% )
    IPC                    2.45  (  +-  4.08% )
    branches             432.00  (  +-   .05% )
    branch-misses          0.38  (  +- 23.68% )
    L1-dcache-loads      444.96  (  +-   .03% )
    L1-dcache-load-misses  5.13  (  +- 73.09% )

(Both aggregated over 12 boot cycles.)

Unclear if the improvement is just run-to-run variation or because of
a slightly denser loop (the list parameter in the list_for_each_entry_rcu()
exit check now comes from a register rather than a constant as before.)

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 kernel/auditsc.c | 86 +++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index bf26f47b5226..dd89a52988b0 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -805,6 +805,41 @@ static bool audit_in_mask(const struct audit_krule *rule, unsigned long val)
 	return rule->mask[word] & bit;
 }
 
+/**
+ * __audit_filter - common filter
+ *
+ * @tsk: associated task
+ * @ctx: audit context
+ * @list: audit filter list
+ * @op: current syscall/uring_op
+ * @name: name to be filtered (used by audit_filter_inode_name)
+ *
+ * return: 1 if we hit a filter, 0 if we don't
+ */
+static int __audit_filter(struct task_struct *tsk,
+			   struct audit_context *ctx,
+			   struct list_head *list,
+			   unsigned long op,
+			   struct audit_names *name)
+{
+	struct audit_entry *e;
+	enum audit_state state;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(e, list, list) {
+		if (unlikely(audit_in_mask(&e->rule, op))) {
+			if (audit_filter_rules(tsk, &e->rule, ctx, name,
+					       &state, false)) {
+				rcu_read_unlock();
+				ctx->current_state = state;
+				return 1;
+			}
+		}
+	}
+	rcu_read_unlock();
+	return 0;
+}
+
 /**
  * audit_filter_uring - apply filters to an io_uring operation
  * @tsk: associated task
@@ -813,24 +848,11 @@ static bool audit_in_mask(const struct audit_krule *rule, unsigned long val)
 static void audit_filter_uring(struct task_struct *tsk,
 			       struct audit_context *ctx)
 {
-	struct audit_entry *e;
-	enum audit_state state;
-
 	if (auditd_test_task(tsk))
 		return;
 
-	rcu_read_lock();
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
-	rcu_read_unlock();
+	__audit_filter(tsk, ctx, &audit_filter_list[AUDIT_FILTER_URING_EXIT],
+			ctx->uring_op, NULL);
 }
 
 /* At syscall exit time, this filter is called if the audit_state is
@@ -841,26 +863,11 @@ static void audit_filter_uring(struct task_struct *tsk,
 static void audit_filter_syscall(struct task_struct *tsk,
 				 struct audit_context *ctx)
 {
-	struct audit_entry *e;
-	enum audit_state state;
-	unsigned long major = ctx->major;
-
 	if (auditd_test_task(tsk))
 		return;
 
-	rcu_read_lock();
-	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
-		if (unlikely(audit_in_mask(&e->rule, major))) {
-			if (audit_filter_rules(tsk, &e->rule, ctx, NULL,
-					       &state, false)) {
-				rcu_read_unlock();
-				ctx->current_state = state;
-				return;
-			}
-		}
-	}
-	rcu_read_unlock();
-	return;
+	__audit_filter(tsk, ctx, &audit_filter_list[AUDIT_FILTER_EXIT],
+			ctx->major, NULL);
 }
 
 /*
@@ -872,17 +879,12 @@ static int audit_filter_inode_name(struct task_struct *tsk,
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
+	/*
+	 * We are called holding an rcu read lock. __audit_filter() will take
+	 * one as well.
+	 */
+	return __audit_filter(tsk, ctx, list, ctx->major, n);
 }
 
 /* At syscall exit time, this filter is called if any audit_names have been
-- 
2.31.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

