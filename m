Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 17772145DF3
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728578;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VAI0ABZA+Xm3UjCdCWFQgXWeZXOiuMA7pxfReQ0pLrw=;
	b=Tddq4TLPhRI38e24mzZ7dLgNhQgt61FAP+5su8yRsE7KRg5aY7S1/wdYshjUTw2DjKEGYN
	XDOUor+0WpDFnFAjC56WHa6GMK0YQiC024v7otgDth6ON+syoWL6ct73QRmQc94Eo+GlGn
	LU4iFAT/Duy0azVxvtE6AzaM0BkA6dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-YZPSNK4dNwiqBUdFBB6b7A-1; Wed, 22 Jan 2020 16:29:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC028018A2;
	Wed, 22 Jan 2020 21:29:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7309CA3;
	Wed, 22 Jan 2020 21:29:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 368FA18089CD;
	Wed, 22 Jan 2020 21:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLTSuR003629 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:29:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 10B58F8A1F; Wed, 22 Jan 2020 21:29:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C758F89F3
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E28A78047B0
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:27 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-5KfhQ-FsPaOLY7W4U16Xpw-1; Wed, 22 Jan 2020 16:29:25 -0500
Received: by mail-lf1-f65.google.com with SMTP id i23so716051lfo.7
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f0IkEaXGVt8hUwF5uD44/2Lbilo5B8J7tUK5oD4D1tM=;
	b=jwBvJ2KCOjHnY4U2hPm6XUNFXOyosMpZsva9Pepr6L2/qln8WszZeAUms1fTR5T2kE
	Do/uOJT6+9u3DCe/+mh58ZNinw9PsBLNRMu82+op0FkfkztMebKWG0kMY3M2mMFU9QSc
	Dn8XMEATd91FZecP0E2NI9edqtMy/47XipO3xhbbmGGw7cbtC+i0TnCnpnbVGKMSoKWW
	T8cGjJsIoXvdciNKaqytDcBJLmUE9Q6sbVlxHdqF0XXSpGdwZIwSsnCUQsiNo0XWIQv0
	ytXV4xQFtdk0kNb8BMU1JY6YyeHgXmJu8S+lMFoNRz5zpI+/rLh4uyV1m6n6gciD5wKw
	TwrA==
X-Gm-Message-State: APjAAAWMVT06g9sC8B9Gay65B8ZUk1WPK/z93DCG5zFm1odf/Ya4CBD4
	ANkhj+oxClS3JcT21+GaLS+f6l7PI/IJZuumTo51
X-Google-Smtp-Source: APXvYqx6r1SK4hKv8XLYG/rNPUwDn+V7yCGZtcjCRWbKMCH81fFEo/59FQtSCiTTXbrKb1kPr0DggWaePW+geWzK5tI=
X-Received: by 2002:ac2:5f59:: with SMTP id 25mr2754662lfz.193.1579728564136; 
	Wed, 22 Jan 2020 13:29:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
In-Reply-To: <6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:29:12 -0500
Message-ID: <CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 5KfhQ-FsPaOLY7W4U16Xpw-1
X-MC-Unique: YZPSNK4dNwiqBUdFBB6b7A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLTSuR003629
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Track the parent container of a container to be able to filter and
> report nesting.
>
> Now that we have a way to track and check the parent container of a
> container, modify the contid field format to be able to report that
> nesting using a carrat ("^") separator to indicate nesting.  The
> original field format was "contid=<contid>" for task-associated records
> and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
> records.  The new field format is
> "contid=<contid>[^<contid>[...]][,<contid>[...]]".

Let's make sure we always use a comma as a separator, even when
recording the parent information, for example:
"contid=<contid>[,^<contid>[...]][,<contid>[...]]"

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h |  1 +
>  kernel/audit.c        | 53 +++++++++++++++++++++++++++++++++++++++++++--------
>  kernel/audit.h        |  1 +
>  kernel/auditfilter.c  | 17 ++++++++++++++++-
>  kernel/auditsc.c      |  2 +-
>  5 files changed, 64 insertions(+), 10 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index ef8e07524c46..68be59d1a89b 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c

> @@ -492,6 +493,7 @@ void audit_switch_task_namespaces(struct nsproxy *ns, struct task_struct *p)
>                 audit_netns_contid_add(new->net_ns, contid);
>  }
>
> +void audit_log_contid(struct audit_buffer *ab, u64 contid);

If we need a forward declaration, might as well just move it up near
the top of the file with the rest of the declarations.

> +void audit_log_contid(struct audit_buffer *ab, u64 contid)
> +{
> +       struct audit_contobj *cont = NULL, *prcont = NULL;
> +       int h;

It seems safer to pass the audit container ID object and not the u64.

> +       if (!audit_contid_valid(contid)) {
> +               audit_log_format(ab, "%llu", contid);

Do we really want to print (u64)-1 here?  Since this is a known
invalid number, would "?" be a better choice?

> +               return;
> +       }
> +       h = audit_hash_contid(contid);
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> +               if (cont->id == contid) {
> +                       prcont = cont;

Why not just pull the code below into the body of this if statement?
It all needs to be done under the RCU read lock anyway and the code
would read much better this way.

> +                       break;
> +               }
> +       if (!prcont) {
> +               audit_log_format(ab, "%llu", contid);
> +               goto out;
> +       }
> +       while (prcont) {
> +               audit_log_format(ab, "%llu", prcont->id);
> +               prcont = prcont->parent;
> +               if (prcont)
> +                       audit_log_format(ab, "^");

In the interest of limiting the number of calls to audit_log_format(),
how about something like the following:

  audit_log_format("%llu", cont);
  iter = cont->parent;
  while (iter) {
    if (iter->parent)
      audit_log_format("^%llu,", iter);
    else
      audit_log_format("^%llu", iter);
    iter = iter->parent;
  }

> +       }
> +out:
> +       rcu_read_unlock();
> +}
> +
>  /*
>   * audit_log_container_id - report container info
>   * @context: task or local context for record

...

> @@ -2705,9 +2741,10 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         if (!ab)
>                 return rc;
>
> -       audit_log_format(ab,
> -                        "op=set opid=%d contid=%llu old-contid=%llu",
> -                        task_tgid_nr(task), contid, oldcontid);
> +       audit_log_format(ab, "op=set opid=%d contid=", task_tgid_nr(task));
> +       audit_log_contid(ab, contid);
> +       audit_log_format(ab, " old-contid=");
> +       audit_log_contid(ab, oldcontid);

This is an interesting case where contid and old-contid are going to
be largely the same, only the first (current) ID is going to be
different; do we want to duplicate all of those IDs?


>         audit_log_end(ab);
>         return rc;
>  }
> @@ -2723,9 +2760,9 @@ void audit_log_container_drop(void)

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

