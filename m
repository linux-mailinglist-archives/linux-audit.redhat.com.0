Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A192E804
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:17:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 254FE307D8E3;
	Wed, 29 May 2019 22:17:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01ADE1822A;
	Wed, 29 May 2019 22:17:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4F351806B12;
	Wed, 29 May 2019 22:17:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMHZ7a007230 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:17:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C86F19C70; Wed, 29 May 2019 22:17:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3659819C6F
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:17:33 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1613181E04
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:17:26 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so3350630lfm.11
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fIvU+ha0PviU/sibSkvPHyTumVcfp/XuVnG8TGWl1tg=;
	b=IhDJTlpcamR/KqtIXXIXgJdfXAsLI2C+ZEXAuUNYlKWGn6wHjE6fpIPNIeDhT7ycQ8
	57igNJrmJ5BNTBnviUUG/OZd+IF7VgnoVis5ZCCvJxb17ZrBByYBXhXN+ZRYNnc3FRIy
	brSYU1jvKSGa+TNQ8WETswSfhGeqztSbfJ7L/bGXevP+zB/TZdI4CXbRsu2J41G+yDwo
	qMRxFM1D7xND12GCJwbw+whugNAe6MnXELtdl7/PWacMAbHfg0mkPJsrxG4ICI+/4Bgd
	Umpf4FN+xj/KrTwt5uEEEDaa00hFCmx8k3DNIvdAxi+WqGo7sS1kO5oJBoew7DOwAn5i
	7ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fIvU+ha0PviU/sibSkvPHyTumVcfp/XuVnG8TGWl1tg=;
	b=B5UFOfQDtKSWjxgOyYmxcxI9I8BSVx1Ac2SXpXDi7bN97fzn5kWX8qzqdoATFdM/2q
	hxvPVYrONlQnCnAlqOG7WVnFgfvSUIBsW60Mqz1GU3DRf6bQPFDjreoeQ0vrPD4E6Hyy
	mcwGF+k5ZaTDZwYibDBgVWRweBBeLYy5Q5cGr2GnbaRZfQALWjO0Q5Z4IFFFTko4gWGB
	BGWTz1D8Bxk9Hpnn1uesFCOsM08LJFgZkA4pUE0cCYL+Tf0/lOYABJi60Z2KH1Z/i/Cf
	nHXCTLvS+0kmO1QStuc8vOFoSwwq1PBxwRYLSbpjiAihAf+sfCUC4I4v3yDji8MLaCOB
	gFew==
X-Gm-Message-State: APjAAAUUdnKVGcfrhQOkgYMDtxXLlAk/jvBqK6XyDs++N/fn7Js01ncy
	SklsR+EL8cXcNBVEALjDn665C3PQmqCTJtBwYu/B
X-Google-Smtp-Source: APXvYqyxrQhJxL6YTK1IQrRGp/CVZ4FR/LfHLvH12rSsobg2OWRzTR6O4bHJaXr5UpPyFchEPI025JnE2t3cIS5I/r8=
X-Received: by 2002:a19:c301:: with SMTP id t1mr140375lff.137.1559168239261;
	Wed, 29 May 2019 15:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<423ed5e5c5e4ed7c3e26ac7d2bd7c267aaae777c.1554732921.git.rgb@redhat.com>
In-Reply-To: <423ed5e5c5e4ed7c3e26ac7d2bd7c267aaae777c.1554732921.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 18:17:08 -0400
Message-ID: <CAHC9VhQ9t-mvJGNCzArjg+MTGNXcZbVrWV4=RUD5ML_bHqua1Q@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 09/10] audit: add support for containerid to
	network namespaces
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 29 May 2019 22:17:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 29 May 2019 22:17:26 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 29 May 2019 22:17:44 +0000 (UTC)

On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Audit events could happen in a network namespace outside of a task
> context due to packets received from the net that trigger an auditing
> rule prior to being associated with a running task.  The network
> namespace could be in use by multiple containers by association to the
> tasks in that network namespace.  We still want a way to attribute
> these events to any potential containers.  Keep a list per network
> namespace to track these audit container identifiiers.
>
> Add/increment the audit container identifier on:
> - initial setting of the audit container identifier via /proc
> - clone/fork call that inherits an audit container identifier
> - unshare call that inherits an audit container identifier
> - setns call that inherits an audit container identifier
> Delete/decrement the audit container identifier on:
> - an inherited audit container identifier dropped when child set
> - process exit
> - unshare call that drops a net namespace
> - setns call that drops a net namespace
>
> Please see the github audit kernel issue for contid net support:
>   https://github.com/linux-audit/audit-kernel/issues/92
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h | 19 +++++++++++
>  kernel/audit.c        | 88 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  kernel/nsproxy.c      |  4 +++
>  3 files changed, 108 insertions(+), 3 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 6c742da66b32..996213591617 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -376,6 +384,75 @@ static struct sock *audit_get_sk(const struct net *net)
>         return aunet->sk;
>  }
>
> +void audit_netns_contid_add(struct net *net, u64 contid)
> +{
> +       struct audit_net *aunet;
> +       struct list_head *contid_list;
> +       struct audit_contid *cont;
> +
> +       if (!net)
> +               return;
> +       if (!audit_contid_valid(contid))
> +               return;
> +       aunet = net_generic(net, audit_net_id);
> +       if (!aunet)
> +               return;
> +       contid_list = &aunet->contid_list;
> +       spin_lock(&aunet->contid_list_lock);
> +       list_for_each_entry_rcu(cont, contid_list, list)
> +               if (cont->id == contid) {
> +                       refcount_inc(&cont->refcount);
> +                       goto out;
> +               }
> +       cont = kmalloc(sizeof(struct audit_contid), GFP_ATOMIC);
> +       if (cont) {
> +               INIT_LIST_HEAD(&cont->list);

I thought you were going to get rid of this INIT_LIST_HEAD() call?

> +               cont->id = contid;
> +               refcount_set(&cont->refcount, 1);
> +               list_add_rcu(&cont->list, contid_list);
> +       }
> +out:
> +       spin_unlock(&aunet->contid_list_lock);
> +}

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
