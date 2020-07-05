Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2D02D214D7B
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:11:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Sx_upMFwMe6g11Oid_M7ig-1; Sun, 05 Jul 2020 11:11:49 -0400
X-MC-Unique: Sx_upMFwMe6g11Oid_M7ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADCC3186A232;
	Sun,  5 Jul 2020 15:11:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B3A5C1B2;
	Sun,  5 Jul 2020 15:11:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 692536C9EC;
	Sun,  5 Jul 2020 15:11:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FBgkp028612 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:11:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04155110DA09; Sun,  5 Jul 2020 15:11:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31A4110DA0A
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE4E8007B3
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:39 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-452-J3KekRVuMT2yqXzqKVKopg-1; Sun, 05 Jul 2020 11:11:37 -0400
X-MC-Unique: J3KekRVuMT2yqXzqKVKopg-1
Received: by mail-ej1-f68.google.com with SMTP id dr13so39776518ejc.3
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vZkOfNBWPs7bSewT5QvZ/73eArXitjKQiDUtUx4ui7w=;
	b=IJKHN1mPJMX8XnhQLhicqrv+9Pi66W6Y8hRymII4HFKIACkTiINinGsu6mwzxk56tF
	ozGOguUrMtp/+Ek1KbwqUTCbKO/z9IVCKh0zOIa7whuyDGywpQJoRYH3TXolnKAxjSKU
	JKvWbOStjH8BactaYO4dYzluFgMYb++ZJUGW00OSOKDmNTh9MKuZfZAbFLFaj5OmsFf/
	juSGISavvR0B+OxI9/wmD8qAzTONyrnAQ6tMmNAvdF6aYBLwaV0pa8EvV9dNKXJQyTEQ
	oGKdy15WupZDmacFNT7idlUytwWCilp5R9Z3yZaQLLxVZkuCqDzeArp4V6UTek5CdZ7K
	n15g==
X-Gm-Message-State: AOAM530FaevK6RAmQaojm3X8UhBC8UYF4Udbgbq1Qze8FW79xpoRS9H0
	D29CS8TNIYMEfyFxQOtRUXq+ZVKFkjk2rXy5kk+i
X-Google-Smtp-Source: ABdhPJwpCSiC6DSoxZdi2hDJdv8okJ+1ja6aScs+thXxUI3Z3zq+l9Mz0Zb046AzwGN/qGJDIKP+LuHU9EesRKGoRdQ=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr34336791eja.178.1593961896028; 
	Sun, 05 Jul 2020 08:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e9c1216a361c38ebc9cb4089922c259e2cfd5013.1593198710.git.rgb@redhat.com>
In-Reply-To: <e9c1216a361c38ebc9cb4089922c259e2cfd5013.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:24 -0400
Message-ID: <CAHC9VhSRRN+Qq5dNx6Q5cG_TrXgbBMR0PNUYvf+Haf2na5wCfg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 10/13] audit: add support for containerid to
	network namespaces
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> This also adds support to qualify NETFILTER_PKT records.
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
> Add audit container identifier auxiliary record(s) to NETFILTER_PKT
> event standalone records.  Iterate through all potential audit container
> identifiers associated with a network namespace.
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
>  include/linux/audit.h    |  20 ++++++
>  kernel/audit.c           | 156 ++++++++++++++++++++++++++++++++++++++++++++++-
>  kernel/nsproxy.c         |   4 ++
>  net/netfilter/nft_log.c  |  11 +++-
>  net/netfilter/xt_AUDIT.c |  11 +++-
>  5 files changed, 195 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index c4a755ae0d61..304fbb7c3c5b 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -128,6 +128,13 @@ struct audit_task_info {
>
>  extern struct audit_task_info init_struct_audit;
>
> +struct audit_contobj_netns {
> +       struct list_head        list;
> +       struct audit_contobj    *obj;
> +       int                     count;

This seems like it might be a good candidate for refcount_t, yes?

> +       struct rcu_head         rcu;
> +};

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 997c34178ee8..a862721dfd9b 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -437,6 +452,136 @@ static struct sock *audit_get_sk(const struct net *net)
>         return aunet->sk;
>  }
>
> +void audit_netns_contid_add(struct net *net, struct audit_contobj *cont)
> +{
> +       struct audit_net *aunet;
> +       struct list_head *contobj_list;
> +       struct audit_contobj_netns *contns;
> +
> +       if (!net)
> +               return;
> +       if (!cont)
> +               return;
> +       aunet = net_generic(net, audit_net_id);
> +       if (!aunet)
> +               return;
> +       contobj_list = &aunet->contobj_list;
> +       rcu_read_lock();
> +       spin_lock(&aunet->contobj_list_lock);
> +       list_for_each_entry_rcu(contns, contobj_list, list)
> +               if (contns->obj == cont) {
> +                       contns->count++;
> +                       goto out;
> +               }
> +       contns = kmalloc(sizeof(*contns), GFP_ATOMIC);
> +       if (contns) {
> +               INIT_LIST_HEAD(&contns->list);
> +               contns->obj = cont;
> +               contns->count = 1;
> +               list_add_rcu(&contns->list, contobj_list);
> +       }
> +out:
> +       spin_unlock(&aunet->contobj_list_lock);
> +       rcu_read_unlock();
> +}
> +
> +void audit_netns_contid_del(struct net *net, struct audit_contobj *cont)
> +{
> +       struct audit_net *aunet;
> +       struct list_head *contobj_list;
> +       struct audit_contobj_netns *contns = NULL;
> +
> +       if (!net)
> +               return;
> +       if (!cont)
> +               return;
> +       aunet = net_generic(net, audit_net_id);
> +       if (!aunet)
> +               return;
> +       contobj_list = &aunet->contobj_list;
> +       rcu_read_lock();
> +       spin_lock(&aunet->contobj_list_lock);
> +       list_for_each_entry_rcu(contns, contobj_list, list)
> +               if (contns->obj == cont) {
> +                       contns->count--;
> +                       if (contns->count < 1) {

One could simplify this with "(--countns->count) < 1", although if it
is changed to a refcount_t (which seems like a smart thing), the
normal decrement/test would be the best choice.


> +                               list_del_rcu(&contns->list);
> +                               kfree_rcu(contns, rcu);
> +                       }
> +                       break;
> +               }
> +       spin_unlock(&aunet->contobj_list_lock);
> +       rcu_read_unlock();
> +}

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

