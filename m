Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A527A1B196B
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 00:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587421662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/nZO/ttt6rc162s4yu4EzHM8NmP4tfgr1a8piTUJQ94=;
	b=Ut0x0nOPi0X1086+lvWn4LBIdh0wm0+4j/3Bwcg6T58VDgPa8T7VIKEL3fWxjhdnkm+myT
	FvFkJ7GIEqEap2KOiMvU0bmEpzV3SNcW99matEDMRQCU6YjPw8y/6yN7hKrqf63RXaz/RH
	d2IugNohoS7Xvj3Z1SWhbP2EqJiZKWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-8dYkbrWFMBuLp7C_zVxj7g-1; Mon, 20 Apr 2020 18:27:40 -0400
X-MC-Unique: 8dYkbrWFMBuLp7C_zVxj7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821938017F5;
	Mon, 20 Apr 2020 22:27:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53482619DB;
	Mon, 20 Apr 2020 22:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68BE593907;
	Mon, 20 Apr 2020 22:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KMRP4H031649 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 18:27:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E3C8105959B; Mon, 20 Apr 2020 22:27:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B026C1059102;
	Mon, 20 Apr 2020 22:27:18 +0000 (UTC)
Date: Mon, 20 Apr 2020 18:27:15 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: fix a net reference leak in audit_send_reply()
Message-ID: <20200420222715.hm3zhk3vadyvi5qq@madcap2.tricolour.ca>
References: <158741309840.178400.7330307620088250679.stgit@chester>
MIME-Version: 1.0
In-Reply-To: <158741309840.178400.7330307620088250679.stgit@chester>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-20 16:04, Paul Moore wrote:
> If audit_send_reply() fails when trying to create a new thread to
> send the reply it also fails to cleanup properly, leaking a reference
> to a net structure.  This patch fixes the error path and makes a
> handful of other cleanups that came up while fixing the code.

Looks good to me.

> Reported-by: teroincn@gmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  kernel/audit.c |   50 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index b69c8b460341..66b81358b64f 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -924,19 +924,30 @@ struct sk_buff *audit_make_reply(int seq, int type, int done,
>  	return NULL;
>  }
>  
> +static void audit_free_reply(struct audit_reply *reply)
> +{
> +	if (!reply)
> +		return;
> +
> +	if (reply->skb)
> +		kfree_skb(reply->skb);
> +	if (reply->net)
> +		put_net(reply->net);
> +	kfree(reply);
> +}
> +
>  static int audit_send_reply_thread(void *arg)
>  {
>  	struct audit_reply *reply = (struct audit_reply *)arg;
> -	struct sock *sk = audit_get_sk(reply->net);
>  
>  	audit_ctl_lock();
>  	audit_ctl_unlock();
>  
>  	/* Ignore failure. It'll only happen if the sender goes away,
>  	   because our timeout is set to infinite. */
> -	netlink_unicast(sk, reply->skb, reply->portid, 0);
> -	put_net(reply->net);
> -	kfree(reply);
> +	netlink_unicast(audit_get_sk(reply->net), reply->skb, reply->portid, 0);
> +	reply->skb = NULL;
> +	audit_free_reply(reply);
>  	return 0;
>  }
>  
> @@ -950,35 +961,32 @@ static int audit_send_reply_thread(void *arg)
>   * @payload: payload data
>   * @size: payload size
>   *
> - * Allocates an skb, builds the netlink message, and sends it to the port id.
> - * No failure notifications.
> + * Allocates a skb, builds the netlink message, and sends it to the port id.
>   */
>  static void audit_send_reply(struct sk_buff *request_skb, int seq, int type, int done,
>  			     int multi, const void *payload, int size)
>  {
> -	struct net *net = sock_net(NETLINK_CB(request_skb).sk);
> -	struct sk_buff *skb;
>  	struct task_struct *tsk;
> -	struct audit_reply *reply = kmalloc(sizeof(struct audit_reply),
> -					    GFP_KERNEL);
> +	struct audit_reply *reply;
>  
> +	reply = kzalloc(sizeof(*reply), GFP_KERNEL);
>  	if (!reply)
>  		return;
>  
> -	skb = audit_make_reply(seq, type, done, multi, payload, size);
> -	if (!skb)
> -		goto out;
> -
> -	reply->net = get_net(net);
> +	reply->skb = audit_make_reply(seq, type, done, multi, payload, size);
> +	if (!reply->skb)
> +		goto err;
> +	reply->net = get_net(sock_net(NETLINK_CB(request_skb).sk));
>  	reply->portid = NETLINK_CB(request_skb).portid;
> -	reply->skb = skb;
>  
>  	tsk = kthread_run(audit_send_reply_thread, reply, "audit_send_reply");
> -	if (!IS_ERR(tsk))
> -		return;
> -	kfree_skb(skb);
> -out:
> -	kfree(reply);
> +	if (IS_ERR(tsk))
> +		goto err;
> +
> +	return;
> +
> +err:
> +	audit_free_reply(reply);
>  }
>  
>  /*
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

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

