Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C765FD2F4
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 03:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TNLkUDZpTYJkuujTww6YqDdDBW5vBFfvrx7Ww2sl+iI=;
	b=dOMLW+dhKDQTLpASIAV96cLlzn0uAMCtZbXzv++GV/rE4F5hWvk0o6Fd9l1Xi9Vk2tDnPT
	J1bFHXkg5dGaLlznn9xylTB2sirmye8uLyEStGaNH+Ly1efMAg3VsbAVZSoVi+n8Kj1Idb
	J6sQhK+b8vTOEWX5QsB0o9HLTW6bVH8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-N6tjMuF9MKOSbs5_iIv1vQ-1; Wed, 12 Oct 2022 21:48:53 -0400
X-MC-Unique: N6tjMuF9MKOSbs5_iIv1vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24FB29DD995;
	Thu, 13 Oct 2022 01:48:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F5E52166BA3;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09C4619465B1;
	Thu, 13 Oct 2022 01:47:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0493A1946588 for <linux-audit@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 21:18:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB2612166BA5; Wed, 12 Oct 2022 21:18:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D47182166BA3
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:18:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65073804507
 for <linux-audit@redhat.com>; Wed, 12 Oct 2022 21:18:38 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch
 [185.125.25.14]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-6vTSlaLlPlaqi6PVLVE_-A-1; Wed, 12 Oct 2022 17:18:37 -0400
X-MC-Unique: 6vTSlaLlPlaqi6PVLVE_-A-1
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MnlrB4xJZzMpyjd;
 Wed, 12 Oct 2022 23:18:34 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
 by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Mnlr96dLbzMpqBK;
 Wed, 12 Oct 2022 23:18:33 +0200 (CEST)
Message-ID: <58adb9d6-3199-00b9-5883-804d5934b024@digikod.net>
Date: Wed, 12 Oct 2022 23:18:33 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v38 09/39] LSM: Add the lsmblob data structure.
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-10-casey@schaufler-ca.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20220927195421.14713-10-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 27/09/2022 21:53, Casey Schaufler wrote:
> When more than one security module is exporting data to
> audit and networking sub-systems a single 32 bit integer
> is no longer sufficient to represent the data. Add a
> structure to be used instead.
> 
> The lsmblob structure is currently an array of
> u32 "secids". There is an entry for each of the security
> modules built into the system that would use secids if
> active. The system assigns the module a "slot" when it
> registers hooks. If modules are compiled in but not
> registered there will be unused slots. The slot number
> is added to the lsm_id structure.
> 
> The audit rules data is expanded to use an array of
> security module data rather than a single instance.
> A new structure audit_lsm_rules is defined to avoid the
> confusion which commonly accompanies the use of
> void ** parameters.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---

[...]

> diff --git a/security/landlock/setup.c b/security/landlock/setup.c
> index 1242c61c9de4..adbe941370f3 100644
> --- a/security/landlock/setup.c
> +++ b/security/landlock/setup.c
> @@ -27,6 +27,7 @@ struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
>   struct lsm_id landlock_lsmid __lsm_ro_after_init = {
>   	.lsm      = LANDLOCK_NAME,
>   	.id       = LSM_ID_LANDLOCK,
> +	.slot     = LSMBLOB_NOT_NEEDED,

Please only use one space after ".slot"

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

