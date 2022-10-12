Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1055FD2EE
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lmGKCVR8UCnEkQmd27vaiogu2YuWDb0jYH2+9Iv03xM=;
	b=Re4FWB7UxEg/H+u5byYuETXEG0K3Xras/+wVM/742SHKZqiYodAtd5ZiA63x4gR12SRuKS
	LPM0K/q6f6Q8XP+Gp/EBHpasLMi62H1ef+0Es6eGBtRTpEwlkY8ENiMjrXk266jia85VGW
	fwxy0+TjOtXwjDV+e4Nh4kk3ae/3rVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-bWuP1SSDP-K8GNGqkRUguA-1; Wed, 12 Oct 2022 21:48:41 -0400
X-MC-Unique: bWuP1SSDP-K8GNGqkRUguA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D59B23C11047;
	Thu, 13 Oct 2022 01:48:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0DA04B3FC8;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50CEB1946A40;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A79881946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:22:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E27F111CA06; Wed, 12 Oct 2022 21:22:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F01111CA02
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:22:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 583493802B80
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:22:49 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch
 [185.125.25.10]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-x12wxLlaOYq0zaYXDGadVw-1; Wed, 12 Oct 2022 17:22:47 -0400
X-MC-Unique: x12wxLlaOYq0zaYXDGadVw-1
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MnllX3JxtzMpvW1;
 Wed, 12 Oct 2022 23:14:32 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4MnllV5LYyzMppqp;
 Wed, 12 Oct 2022 23:14:30 +0200 (CEST)
Message-ID: <b5ddec1b-c086-9421-bc64-cdb59324594d@digikod.net>
Date: Wed, 12 Oct 2022 23:14:30 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 01/39] LSM: Identify modules by more than name
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-2-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927195421.14713-2-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 13 Oct 2022 01:47:50 +0000
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Please Cc me for the next versions.


On 27/09/2022 21:53, Casey Schaufler wrote:
> Create a struct lsm_id to contain identifying information
> about Linux Security Modules (LSMs). At inception this contains
> a single member, which is the name of the module. Change the
> security_add_hooks() interface to use this structure. Change
> the individual modules to maintain their own struct lsm_id and
> pass it to security_add_hooks().
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---

[...]

> diff --git a/security/landlock/setup.c b/security/landlock/setup.c
> index f8e8e980454c..fc7b69c5839e 100644
> --- a/security/landlock/setup.c
> +++ b/security/landlock/setup.c
> @@ -23,6 +23,10 @@ struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
>   	.lbs_superblock = sizeof(struct landlock_superblock_security),
>   };
>   
> +struct lsm_id landlock_lsmid __lsm_ro_after_init = {
> +	.lsm      = LANDLOCK_NAME,

Please only use one space after ".lsm". This applies for other commits 
as well.

This command will do the trick:
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --tree-filter 
"clang-format-14 -i security/landlock/*.[ch]" v6.0-rc7..

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

