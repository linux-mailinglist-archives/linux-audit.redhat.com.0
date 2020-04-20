Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B49E51B18E3
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 23:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587419804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pu8cMn81Voz7fWJ048pxTMzSNfHwt1Io9wZb6q6Yphk=;
	b=Q+21d+EfnYPnstOXeksuD2oGIQlo3Wg/WnqIsFaN1a0vJnpuSF+jXaLNeP5vBlAHaXZmFJ
	buEx29r9+PhTcVyFM3Tqzf2Lse461R07gI7P6yGcBaKj8veaQF9tlga7MqO+AK2/p5OsvV
	vypf9nLPims684so5XyzRpc3KtJV92Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-w3VzXsuUMseZKoQme09P0w-1; Mon, 20 Apr 2020 17:56:42 -0400
X-MC-Unique: w3VzXsuUMseZKoQme09P0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED936107ACCC;
	Mon, 20 Apr 2020 21:56:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2796C1001B30;
	Mon, 20 Apr 2020 21:56:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12EA093902;
	Mon, 20 Apr 2020 21:56:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KLuOgh030062 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 17:56:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F2565DA7C; Mon, 20 Apr 2020 21:56:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC515DA76;
	Mon, 20 Apr 2020 21:56:18 +0000 (UTC)
Date: Mon, 20 Apr 2020 17:56:15 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: check the length of userspace generated audit
	records
Message-ID: <20200420215615.chh4c5ytxumadtt7@madcap2.tricolour.ca>
References: <158741856073.246860.5955712228915579.stgit@chester>
MIME-Version: 1.0
In-Reply-To: <158741856073.246860.5955712228915579.stgit@chester>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-20 17:36, Paul Moore wrote:
> Commit 756125289285 ("audit: always check the netlink payload length
> in audit_receive_msg()") fixed a number of missing message length
> checks, but forgot to check the length of userspace generated audit
> records.  The good news is that you need CAP_AUDIT_WRITE to submit
> userspace audit records, which is generally only given to trusted
> processes, so the impact should be limited.
> 
> Cc: stable@vger.kernel.org
> Fixes: 756125289285 ("audit: always check the netlink payload length in audit_receive_msg()")
> Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/audit.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index b69c8b460341..87f31bf1f0a0 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  	case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
>  		if (!audit_enabled && msg_type != AUDIT_USER_AVC)
>  			return 0;
> +		/* exit early if there isn't at least one character to print */
> +		if (data_len < 2)
> +			return -EINVAL;

Don't we want to issue the record even if the message is empty?  If a
len of 1 is passed in, it will properly set str[0] = '\0' and str points
to a location with a null that prints nothing between the single quotes
of "msg=''".  So, I think that should be "if (data_len < 1)".

Am I missing something?

>  		err = audit_filter(msg_type, AUDIT_FILTER_USER);
>  		if (err == 1) { /* match or error */
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

