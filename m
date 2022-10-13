Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 492665FD792
	for <lists+linux-audit@lfdr.de>; Thu, 13 Oct 2022 12:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665655494;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WNoicLieQcpzyrG1XpTT1Z+uYAmhTopUX1I1pm+/JKs=;
	b=Y8V8pUn61C642JvEdPFDf+tVL19vDjVelfZoiB8xDv3IFy63SrIh6MuLsyY0JC+Tg2Hh3g
	L4QaLN47SMIVQq0SB0Steko7Sy7Y73OYIOf9DOtZYGGzfMsXoahLn6aooxVpddwQxg6zkh
	GM0ubX9w2ljno7dpq3KWdwd/nY2iOak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-3SIkCcvuPZ64-e-CaZbrVg-1; Thu, 13 Oct 2022 06:04:50 -0400
X-MC-Unique: 3SIkCcvuPZ64-e-CaZbrVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BFC829AA38B;
	Thu, 13 Oct 2022 10:04:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 783614B3FC8;
	Thu, 13 Oct 2022 10:04:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D68DD19465A4;
	Thu, 13 Oct 2022 10:04:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D48641946588 for <linux-audit@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 10:04:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 998D31415108; Thu, 13 Oct 2022 10:04:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C19140EBF3
 for <linux-audit@redhat.com>; Thu, 13 Oct 2022 10:04:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46296811E84
 for <linux-audit@redhat.com>; Thu, 13 Oct 2022 10:04:37 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-c7JTOdKeNBOJCAQ5Fn0CXQ-1; Thu, 13 Oct 2022 06:04:35 -0400
X-MC-Unique: c7JTOdKeNBOJCAQ5Fn0CXQ-1
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29DA47B6033225;
 Thu, 13 Oct 2022 19:04:07 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Thu, 13 Oct 2022 19:04:07 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29DA47NY033222
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 Oct 2022 19:04:07 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
Date: Thu, 13 Oct 2022 19:04:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20220927195421.14713-5-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/09/28 4:53, Casey Schaufler wrote:
> @@ -483,6 +491,16 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
>  {
>  	int i;
>  
> +	/*
> +	 * A security module may call security_add_hooks() more
> +	 * than once. Landlock is one such case.
> +	 */
> +	if (lsm_id == 0 || lsm_idlist[lsm_id - 1] != lsmid)
> +		lsm_idlist[lsm_id++] = lsmid;
> +
> +	if (lsm_id > LSMID_ENTRIES)
> +		panic("%s Too many LSMs registered.\n", __func__);

I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.

I'm fine with using UAPI-visible constants for switching /proc/ files.
But TOMOYO does not need such constant because TOMOYO does not use /proc/ files.

Also, lsm_self_attr() will be limited for LSM modules which use /proc/ files, and
therefore I think prctl() will be already there.

> +
>  	for (i = 0; i < count; i++) {
>  		hooks[i].lsmid = lsmid;
>  		hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

