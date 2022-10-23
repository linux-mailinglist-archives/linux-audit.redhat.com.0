Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48058609240
	for <lists+linux-audit@lfdr.de>; Sun, 23 Oct 2022 12:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666519983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e0fU35HFQzAO07Ijs2Fov4Me0aEaI+Xh6dJ2on40LpA=;
	b=Fsr9/T4mXq9D5Tku7jC2p+/pgKpPLlSpqtX9ColN0HP6vETojnWkwSminsIpHUtIVB3DaJ
	xBAgiXafL1J7Gm7xbtPH2kDwdDEFJrqFPXbnuScR285nBN1o74WoalovpTX3diYWk5xwhZ
	o3Us593r6cMRPtD+vJkXM5xTsdHOmhI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-z6wOTKQsOmu3X89qItDVfA-1; Sun, 23 Oct 2022 06:13:01 -0400
X-MC-Unique: z6wOTKQsOmu3X89qItDVfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8A33C025C4;
	Sun, 23 Oct 2022 10:12:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 692C340107F;
	Sun, 23 Oct 2022 10:12:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C294819465A2;
	Sun, 23 Oct 2022 10:12:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 764891946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 10:12:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C7C62024CCA; Sun, 23 Oct 2022 10:12:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 850982024CC0
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 10:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38A63C0CD4E
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 10:12:37 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-W9EVhziqOZeG4D4yQQotVg-1; Sun, 23 Oct 2022 06:12:30 -0400
X-MC-Unique: W9EVhziqOZeG4D4yQQotVg-1
Received: from fsav116.sakura.ne.jp (fsav116.sakura.ne.jp [27.133.134.243])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29NABW6a014366;
 Sun, 23 Oct 2022 19:11:32 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav116.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp);
 Sun, 23 Oct 2022 19:11:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29NAAh1h014195
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 23 Oct 2022 19:11:32 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <280c313e-c826-3b9c-a074-2ead3cf4107f@I-love.SAKURA.ne.jp>
Date: Sun, 23 Oct 2022 19:10:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
 <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
 <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
In-Reply-To: <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/23 16:27, Tetsuo Handa wrote:
> On 2022/10/21 8:42, Casey Schaufler wrote:
>> I will, on the other hand, listen to compelling arguments. It is not the
>> intention of this code to lock out loadable modules. If I thought it would
>> I would not have proposed it.
> 
> This code is exactly for locking out loadable modules.
> 

Imagine a situation where two individuals independently develop their own
web applications using the same identifier, and then their web applications
started working together with other web applications using that identifier.
When they published their web applications for public and wider use, a problem
that both web applications are already using the same identifier arises.
It is too late to reassign the identifier.

The same trouble can happen with loadable LSM modules. Unless the upstream kernel
behaves as if a DNS registerer that assigns a unique domainname for whatever web
sites (regardless of whether a web site is for public or not), defining a permanent
constant for LSM module is a way towards locking out loadable LSM modules. And it
is well possible that a loadable LSM module wants to run on older kernels which
do not have LSM id defined yet.

This "define LSM id as userspace visible constant" is more dangerous than just
reserving some space for future use. You are trying to control all IP addresses
for the sake of only in-tree LSM modules. No, no, no, please don't do that...

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

