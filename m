Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 89B691B4D48
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 21:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587583514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kxIaac7+OlnBZwTfaxjMl/1QdIM0WZvxCa3U6ofu9Is=;
	b=MY4JosMqh5cEGOQbTv5n3nu7S5W6tHdwTloWK/9sXQEWH1VA977opDnlpgQ1QROOqcEhND
	8PXcbHzVakUhCddyMnAV+v8Cl2S6WoeG+6MiTs8vZ7ZObOFlmfMUHKK9WLgaEMPdlyMPFd
	XnHlCSuqjYZGFNJh1A3kfX2NMQbkIhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-_sw-7xaNOoqUjvBSDwRomQ-1; Wed, 22 Apr 2020 15:25:12 -0400
X-MC-Unique: _sw-7xaNOoqUjvBSDwRomQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4144413FE;
	Wed, 22 Apr 2020 19:25:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA3819C70;
	Wed, 22 Apr 2020 19:25:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6784938FB;
	Wed, 22 Apr 2020 19:25:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MJOt8n002529 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 15:24:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75B5449C3A; Wed, 22 Apr 2020 19:24:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B97464022
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 19:24:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FB1802065
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 19:24:52 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-112-xclFlahTMUmuy4a_RKEzbA-1; Wed, 22 Apr 2020 15:24:40 -0400
X-MC-Unique: xclFlahTMUmuy4a_RKEzbA-1
Received: by mail-ed1-f68.google.com with SMTP id w2so2420383edx.4
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 12:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ijVqzick1cLEtGfwZgB0m+1D2hXKWP/ZSc+Ead5/orQ=;
	b=QvKZwyuderaOcJ3bMNimL6a6Tm2AScqRfgAnxxj1Yt5MtkWXoCZGPzYkzv1xd/tgcT
	x9D/9rSS1VWtizdoQfAxzRzIc+PC+pIazxWHyn6uoz9mceWp+G0JZQ/+0aidzAtFkrI1
	uASmwKMLmQ6Qdqsjz0tTt3L8pa4+9UBGJpej6Rf+ywYnaVKVZJnO/WxUCJMjrD03EX/3
	hRARam1pLQy8BqxFZIzD2MWmKraDQkc9maQ8T0niYGcOGfCbztte8HJjbhNX+RThd+n4
	F0UxTCzbUG3yEfH++WL0zvjB+3KQsnsrF4WhvmKe/ecrtGwquW2G5qD/muKEQbiVd4Lw
	+uiA==
X-Gm-Message-State: AGi0PuaCCZ5cybyZyjV5uT/5m8iyv0en/lNdSoPYFm2MHT3xtNwJvaTR
	mZT1Tjdtf838pyySeCZ2m9vgzblBqMsQ+exGs3Xy
X-Google-Smtp-Source: APiQypLcXxX5B918t9dxWZwVc7B687QhuW4jShUfyoxbqxzcsWmdfecH8L39fbyK/7/eP1dJBgVYCk3F6EH5n3lgaCo=
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr114856edw.135.1587583478494; 
	Wed, 22 Apr 2020 12:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <158748523449.111602.4138038965474505567.stgit@chester>
	<20200422190537.frfshym7stqjscih@madcap2.tricolour.ca>
In-Reply-To: <20200422190537.frfshym7stqjscih@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2020 15:24:27 -0400
Message-ID: <CAHC9VhRXxXkaVfStnqXYnGfnPbwVcsau9xt745-_Xzxu7oUC_Q@mail.gmail.com>
Subject: Re: [PATCH] audit: fix a net reference leak in audit_list_rules_send()
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MJOt8n002529
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, teroincn@gmail.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2020 at 3:05 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2020-04-21 12:07, Paul Moore wrote:
> > If audit_list_rules_send() fails when trying to create a new thread
> > to send the rules it also fails to cleanup properly, leaking a
> > reference to a net structure.  This patch fixes the error patch and
> > renames audit_send_list() to audit_send_list_thread() to better
> > match its cousin, audit_send_reply_thread().
>
> Ok, like audit_send_reply(), looks good to me.
>
> > Reported-by: teroincn@gmail.com
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

Thanks.  I just merged this into audit/next.

> > ---
> >  kernel/audit.c       |    2 +-
> >  kernel/audit.h       |    2 +-
> >  kernel/auditfilter.c |   16 +++++++---------
> >  3 files changed, 9 insertions(+), 11 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 66b81358b64f..622c30246d19 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -880,7 +880,7 @@ static int kauditd_thread(void *dummy)
> >       return 0;
> >  }
> >
> > -int audit_send_list(void *_dest)
> > +int audit_send_list_thread(void *_dest)
> >  {
> >       struct audit_netlink_list *dest = _dest;
> >       struct sk_buff *skb;
> > diff --git a/kernel/audit.h b/kernel/audit.h
> > index 2eed4d231624..f0233dc40b17 100644
> > --- a/kernel/audit.h
> > +++ b/kernel/audit.h
> > @@ -229,7 +229,7 @@ struct audit_netlink_list {
> >       struct sk_buff_head q;
> >  };
> >
> > -int audit_send_list(void *_dest);
> > +int audit_send_list_thread(void *_dest);
> >
> >  extern int selinux_audit_rule_update(void);
> >
> > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > index 026e34da4ace..a10e2997aa6c 100644
> > --- a/kernel/auditfilter.c
> > +++ b/kernel/auditfilter.c
> > @@ -1161,11 +1161,8 @@ int audit_rule_change(int type, int seq, void *data, size_t datasz)
> >   */
> >  int audit_list_rules_send(struct sk_buff *request_skb, int seq)
> >  {
> > -     u32 portid = NETLINK_CB(request_skb).portid;
> > -     struct net *net = sock_net(NETLINK_CB(request_skb).sk);
> >       struct task_struct *tsk;
> >       struct audit_netlink_list *dest;
> > -     int err = 0;
> >
> >       /* We can't just spew out the rules here because we might fill
> >        * the available socket buffer space and deadlock waiting for
> > @@ -1173,25 +1170,26 @@ int audit_list_rules_send(struct sk_buff *request_skb, int seq)
> >        * happen if we're actually running in the context of auditctl
> >        * trying to _send_ the stuff */
> >
> > -     dest = kmalloc(sizeof(struct audit_netlink_list), GFP_KERNEL);
> > +     dest = kmalloc(sizeof(*dest), GFP_KERNEL);
> >       if (!dest)
> >               return -ENOMEM;
> > -     dest->net = get_net(net);
> > -     dest->portid = portid;
> > +     dest->net = get_net(sock_net(NETLINK_CB(request_skb).sk));
> > +     dest->portid = NETLINK_CB(request_skb).portid;
> >       skb_queue_head_init(&dest->q);
> >
> >       mutex_lock(&audit_filter_mutex);
> >       audit_list_rules(seq, &dest->q);
> >       mutex_unlock(&audit_filter_mutex);
> >
> > -     tsk = kthread_run(audit_send_list, dest, "audit_send_list");
> > +     tsk = kthread_run(audit_send_list_thread, dest, "audit_send_list");
> >       if (IS_ERR(tsk)) {
> >               skb_queue_purge(&dest->q);
> > +             put_net(dest->net);
> >               kfree(dest);
> > -             err = PTR_ERR(tsk);
> > +             return PTR_ERR(tsk);
> >       }
> >
> > -     return err;
> > +     return 0;
> >  }
> >
> >  int audit_comparator(u32 left, u32 op, u32 right)
> >

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

