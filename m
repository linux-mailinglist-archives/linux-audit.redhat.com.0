Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A66D3647
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:39:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90A8E80F7C;
	Fri, 11 Oct 2019 00:39:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7751001956;
	Fri, 11 Oct 2019 00:39:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 346654A486;
	Fri, 11 Oct 2019 00:39:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0dpNc028885 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:39:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB8065D721; Fri, 11 Oct 2019 00:39:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E65F95D713
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:49 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50A1B3084249
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:48 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d17so5738175lfa.7
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N487as+c+FNQH8UKaT6HaOwU2u0KpBH93Y19zrHfpEU=;
	b=ufwcAAv+UFt3XUw6Rd8NAzS51flGDXx3ywuA5XIH5+S2oFoO1Eaf6UmFdjOUMI6gka
	6yCyta6ksoQrqSOl/4+hkHsG2c7boYbSkNyYM6xN8dBIPbyC96ggLQiwD1//Cssn99Rv
	66i8F1CDFiyrlz+9H6hdBO4lrbiRgJ+nzfIONCUyXnWD2+c1GE1f7j8L2AMRZBEfy9g5
	ZZYXTCvADd7l7/9pzVM3B1yUR1VRIxbYY8Yzx/B6+8NzIhME/H8YnuE2Mh06ykvkFBst
	ktCU1ig6EE3fVh6p9t8PnxmUOgUALw4WIVCUzgXCP7JYSSNw42EzsQ/ca4pdqBnSXpKU
	7bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N487as+c+FNQH8UKaT6HaOwU2u0KpBH93Y19zrHfpEU=;
	b=Pit78Mtn3NSTI1rXIaQ3kr6jlNgrigD2i5YGL1gDEYSEf6HTP2PV9hAO6Xrssi19Hh
	Ua5+j7ZJJqQBIsDyc7C+snNCj49jVlwS3Xf1n5lsxby3z5xsPVMRcjd5HIuhjOrvey/s
	2sOZuGXGBHkYmlaXkiyd5qOHgqaE5iXXQ5VEkCjeNMbYF08FVg3ej5d8nMcCqif/HaST
	xgAD3c0kVUP+YGnD2eN0grjmU1u1Qah/ccNK/ypH8XGyNyQOgRXB9viOCImAMnbdBXmh
	G6VF2WOrU+K2bUsyTsdIwMwpKzaJmHeuI0FJeApd79/Uvdi5Yww8CSLHlBlKyQUO+EGk
	m38A==
X-Gm-Message-State: APjAAAWVxYsw8TRxnKih3T5rxQlUY3GQuhe37uOx7aoTHzd8G2g0uuoE
	Ya0MoZ0v+q84E4YxBqimXRWaxh+1jmdmC74tqwGv
X-Google-Smtp-Source: APXvYqyB4RJDQCQWsrtqXfnRzChlUNiZfRjoEHOyfVUdO0CSjjh+KCjiX6b5mwIZ8VzpJPbiupVbYYs83JZ7LdEfTCQ=
X-Received: by 2002:a19:2394:: with SMTP id j142mr7362655lfj.13.1570754386530; 
	Thu, 10 Oct 2019 17:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<91315ac64b44bcad9dfc623fa7fefe67d7d2561b.1568834524.git.rgb@redhat.com>
In-Reply-To: <91315ac64b44bcad9dfc623fa7fefe67d7d2561b.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:39:35 -0400
Message-ID: <CAHC9VhRgOTfZzzv+NxxH3D3FN-2A=cd2h1+oDc2cabLhzi4gfQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 12/21] audit: add support for containerid to
	network namespaces
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 11 Oct 2019 00:39:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 11 Oct 2019 00:39:48 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 11 Oct 2019 00:39:55 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
>  kernel/audit.c        | 87 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  kernel/nsproxy.c      |  4 +++
>  3 files changed, 108 insertions(+), 2 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 7cdb76b38966..e0c27bc39925 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -373,6 +381,75 @@ static struct sock *audit_get_sk(const struct net *net)
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

 kmalloc(sizeof(*cont), GFP_ATOMIC)


> +       if (cont) {
> +               INIT_LIST_HEAD(&cont->list);
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
