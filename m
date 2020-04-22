Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B77371B4D04
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 21:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587582386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ev0d86lkPQTBpXe691I+L/GgXWaT53p878LfuFv7+ZM=;
	b=foOZ2AIFmf6E0HCIfhqvUqN5rVV7n9mDI8YGtrxqEJ0L6SPtsDXXNoLrZ2j2xPLgCXdMuU
	Uzoemur3uPliUT7dvkA4rdOA7ziIC05VRo1gfJiDGi0WLKkMS/5v35kOT71zjru5hFPcIc
	ATfDVi1eRNopW82UYTGsA/JrqfglDW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-O1AO8f6jP6eANstqozn03A-1; Wed, 22 Apr 2020 15:06:14 -0400
X-MC-Unique: O1AO8f6jP6eANstqozn03A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD2A13FB;
	Wed, 22 Apr 2020 19:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 739455D706;
	Wed, 22 Apr 2020 19:06:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49FCD9338A;
	Wed, 22 Apr 2020 19:05:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MJ5l0W001300 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 15:05:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A72D19C70; Wed, 22 Apr 2020 19:05:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C787C19C69;
	Wed, 22 Apr 2020 19:05:40 +0000 (UTC)
Date: Wed, 22 Apr 2020 15:05:37 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: fix a net reference leak in audit_list_rules_send()
Message-ID: <20200422190537.frfshym7stqjscih@madcap2.tricolour.ca>
References: <158748523449.111602.4138038965474505567.stgit@chester>
MIME-Version: 1.0
In-Reply-To: <158748523449.111602.4138038965474505567.stgit@chester>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-21 12:07, Paul Moore wrote:
> If audit_list_rules_send() fails when trying to create a new thread
> to send the rules it also fails to cleanup properly, leaking a
> reference to a net structure.  This patch fixes the error patch and
> renames audit_send_list() to audit_send_list_thread() to better
> match its cousin, audit_send_reply_thread().

Ok, like audit_send_reply(), looks good to me.

> Reported-by: teroincn@gmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  kernel/audit.c       |    2 +-
>  kernel/audit.h       |    2 +-
>  kernel/auditfilter.c |   16 +++++++---------
>  3 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 66b81358b64f..622c30246d19 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -880,7 +880,7 @@ static int kauditd_thread(void *dummy)
>  	return 0;
>  }
>  
> -int audit_send_list(void *_dest)
> +int audit_send_list_thread(void *_dest)
>  {
>  	struct audit_netlink_list *dest = _dest;
>  	struct sk_buff *skb;
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 2eed4d231624..f0233dc40b17 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -229,7 +229,7 @@ struct audit_netlink_list {
>  	struct sk_buff_head q;
>  };
>  
> -int audit_send_list(void *_dest);
> +int audit_send_list_thread(void *_dest);
>  
>  extern int selinux_audit_rule_update(void);
>  
> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 026e34da4ace..a10e2997aa6c 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -1161,11 +1161,8 @@ int audit_rule_change(int type, int seq, void *data, size_t datasz)
>   */
>  int audit_list_rules_send(struct sk_buff *request_skb, int seq)
>  {
> -	u32 portid = NETLINK_CB(request_skb).portid;
> -	struct net *net = sock_net(NETLINK_CB(request_skb).sk);
>  	struct task_struct *tsk;
>  	struct audit_netlink_list *dest;
> -	int err = 0;
>  
>  	/* We can't just spew out the rules here because we might fill
>  	 * the available socket buffer space and deadlock waiting for
> @@ -1173,25 +1170,26 @@ int audit_list_rules_send(struct sk_buff *request_skb, int seq)
>  	 * happen if we're actually running in the context of auditctl
>  	 * trying to _send_ the stuff */
>  
> -	dest = kmalloc(sizeof(struct audit_netlink_list), GFP_KERNEL);
> +	dest = kmalloc(sizeof(*dest), GFP_KERNEL);
>  	if (!dest)
>  		return -ENOMEM;
> -	dest->net = get_net(net);
> -	dest->portid = portid;
> +	dest->net = get_net(sock_net(NETLINK_CB(request_skb).sk));
> +	dest->portid = NETLINK_CB(request_skb).portid;
>  	skb_queue_head_init(&dest->q);
>  
>  	mutex_lock(&audit_filter_mutex);
>  	audit_list_rules(seq, &dest->q);
>  	mutex_unlock(&audit_filter_mutex);
>  
> -	tsk = kthread_run(audit_send_list, dest, "audit_send_list");
> +	tsk = kthread_run(audit_send_list_thread, dest, "audit_send_list");
>  	if (IS_ERR(tsk)) {
>  		skb_queue_purge(&dest->q);
> +		put_net(dest->net);
>  		kfree(dest);
> -		err = PTR_ERR(tsk);
> +		return PTR_ERR(tsk);
>  	}
>  
> -	return err;
> +	return 0;
>  }
>  
>  int audit_comparator(u32 left, u32 op, u32 right)
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

