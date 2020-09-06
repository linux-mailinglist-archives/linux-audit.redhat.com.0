Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 527F025EC24
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 04:29:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-RR0a4RhbNny2dRSd1QBTOw-1; Sat, 05 Sep 2020 22:29:05 -0400
X-MC-Unique: RR0a4RhbNny2dRSd1QBTOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E771005E72;
	Sun,  6 Sep 2020 02:28:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E44115D9CC;
	Sun,  6 Sep 2020 02:28:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD7EF18561B1;
	Sun,  6 Sep 2020 02:28:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0862SMom019381 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 22:28:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C34EB100321E; Sun,  6 Sep 2020 02:28:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8501003342
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:28:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50BF3185A78B
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:28:20 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-362-2gLXs80IOu-WYUAJDIzISg-1; Sat, 05 Sep 2020 22:28:17 -0400
X-MC-Unique: 2gLXs80IOu-WYUAJDIzISg-1
Received: by mail-ed1-f66.google.com with SMTP id g4so9492137edk.0
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 19:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cCo0id/2is2dpgsXzWC/QchoFeLB3g9IWCE8dT7egww=;
	b=XSdgLNGXfNzHEE7GdYT3L65MjHJJUUFWyS73i6eA0INouPyoiW0hwkyr5e9xao9yCP
	7GnDnygNedsKh6xCYN/WbGtwc2SC/QEemxVcwJc3Y7opLbHO6OPIG6DmlET189SW+IjZ
	jf49gbN18QeisJPgbudqe3DCNZASW8MPspWvh+RtA5vti97tSIpE7j503hQpnrZFVEu5
	T4g/8+fG9ZT9/WWd493c1sUQhWNr+26TQvx1RTN1WYu90fRABoeTjdBL3GCgxHA/5i89
	GQ141EYlm7x1OyOQirP1eFvrdti+WOzk1MmW3WnNGwlRt+v2cgRsrWMMO6ALYczLCPfE
	Q36w==
X-Gm-Message-State: AOAM532QwGD+u45w9kGIbH1bm1k9SZumnUbaLftPEz9/w9e6IZeBtj7R
	+/zpRE0mwu5+XzbufrdHAkJ3J8r5Axy7si6vbb2F
X-Google-Smtp-Source: ABdhPJwHZqHN5sltWYxscWqbmhHYoVAOTXYGd8ZprL26rtgepGpVPWVbQ4OprJf+82+dtQhOf0MFA8fV6g8brrPgmtQ=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr15494957edw.31.1599359296292; 
	Sat, 05 Sep 2020 19:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-13-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-13-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 22:28:05 -0400
Message-ID: <CAHC9VhTcRmsBtVfUXGrm9+PPzz2ONkqOMvC-bwNdO9fOR9KF-w@mail.gmail.com>
Subject: Re: [PATCH v20 12/23] IMA: Change internal interfaces to use lsmblobs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, linux-integrity@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:14 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> The IMA interfaces ima_get_action() and ima_match_policy()
> call LSM functions that use lsmblobs. Change the IMA functions
> to pass the lsmblob to be compatible with the LSM functions.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: linux-integrity@vger.kernel.org
> ---
>  security/integrity/ima/ima.h          | 11 +++++----
>  security/integrity/ima/ima_api.c      | 10 ++++----
>  security/integrity/ima/ima_appraise.c |  6 ++---
>  security/integrity/ima/ima_main.c     | 35 +++++++++++----------------
>  security/integrity/ima/ima_policy.c   | 14 +++++------
>  5 files changed, 34 insertions(+), 42 deletions(-)

...

> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index a86b35dad4fa..b057c758b430 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -519,7 +519,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
>                 case LSM_SUBJ_USER:
>                 case LSM_SUBJ_ROLE:
>                 case LSM_SUBJ_TYPE:
> -                       lsmblob_init(&lsmdata, secid);
>                         rc = ima_filter_rule_match(&lsmdata, rule->lsm[i].type,
>                                                    Audit_equal,
>                                                    rule->lsm[i].rules);

I'm jumping across patches in this patchset so I may have missed
something, but I think the ima_filter_rule_match() call should be
using the passed "blob" pointer and not the local "lsmdata" right?  If
this is correct, I think this patch can also remove the local
"lsmdata" as well.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

