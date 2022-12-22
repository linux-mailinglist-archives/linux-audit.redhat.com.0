Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A7654785
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 21:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671742055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GbnRhRRpvOzvhkgHQl3WUw9vQiGeC/CR2buQFyaqQgI=;
	b=VSR7p8N7xv1XNUpBL0g59N6XBBHRdFmbCX0Q7yNsr1EI530v91ujr3gWdyDl5423VUr4Wc
	SQEGPr3AwPY0OM7Kdt98+EyL+vlwQaY4Bl9TRTo0Qs6KNxCnhucTqkBwsdr8bTU8JHkxcI
	Si6AE8Nj92JtxIX4Tp3K3+KAlYM0plA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-3KiKW6gaMjW1Pygb0S0krw-1; Thu, 22 Dec 2022 15:47:31 -0500
X-MC-Unique: 3KiKW6gaMjW1Pygb0S0krw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30CCE196EF8B;
	Thu, 22 Dec 2022 20:47:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C72204014EB9;
	Thu, 22 Dec 2022 20:47:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E7731946A40;
	Thu, 22 Dec 2022 20:47:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DA5C19465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 20:47:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28FB11415303; Thu, 22 Dec 2022 20:47:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3ABE14152F4;
 Thu, 22 Dec 2022 20:47:23 +0000 (UTC)
Date: Thu, 22 Dec 2022 15:47:21 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <Y6TCWe4/nR957pFh@madcap2.tricolour.ca>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
MIME-Version: 1.0
In-Reply-To: <20221216164342.ojcbdifdmafq5njw@quack3>
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
Cc: linux-api@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-12-16 17:43, Jan Kara wrote:
> On Mon 12-12-22 09:06:10, Richard Guy Briggs wrote:
> > This patch adds a flag, FAN_INFO and an extensible buffer to provide
> > additional information about response decisions.  The buffer contains
> > one or more headers defining the information type and the length of the
> > following information.  The patch defines one additional information
> > type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
> > allow for the creation of other information types in the future if other
> > users of the API identify different needs.
> > 
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
> > Suggested-by: Jan Kara <jack@suse.cz>
> > Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> 
> Thanks for the patches. They look very good to me. Just two nits below. I
> can do the small updates on commit if there would be no other changes. But
> I'd like to get some review from audit guys for patch 3/3 before I commit
> this.

I'd prefer to send a followup patch based on your recommendations rather
than have you modify it.  It does save some back and forth though...

> > diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> > index caa1211bac8c..cf3584351e00 100644
> > --- a/fs/notify/fanotify/fanotify_user.c
> > +++ b/fs/notify/fanotify/fanotify_user.c
> > @@ -283,19 +283,44 @@ static int create_fd(struct fsnotify_group *group, const struct path *path,
> >  	return client_fd;
> >  }
> >  
> > +static int process_access_response_info(int fd, const char __user *info, size_t info_len,
> > +					struct fanotify_response_info_audit_rule *friar)
> 
> I prefer to keep lines within 80 columns, unless there is really good
> reason (like with strings) to have them longer.

Sure.  In this case, it buys us little since the last line is lined up
with the arguments openning bracket and it one long struct name unless I
unalign that argument and back up the indent by one.

> BTW, why do you call the info structure 'friar'? I feel some language twist
> escapes me ;)

Fanotify_Response_Info_Audit_Rule, it is a pronounceable word, and
besides they have a long reputation for making good beer.  :-D

> > +{
> > +	if (fd == FAN_NOFD)
> > +		return -ENOENT;
> 
> I would not test 'fd' in this function at all. After all it is not part of
> the response info structure and you do check it in
> process_access_response() anyway.

I wrestled with that.  I was even tempted to swallow the following fd
check too, but the flow would not have made as much sense for the
non-INFO case.

My understanding from Amir was that FAN_NOFD was only to be sent in in
conjuction with FAN_INFO to test if a newer kernel was present.

I presumed that if FAN_NOFD was present without FAN_INFO that was an
invalid input to an old kernel.

> > +
> > +	if (info_len != sizeof(*friar))
> > +		return -EINVAL;
> > +
> > +	if (copy_from_user(friar, info, sizeof(*friar)))
> > +		return -EFAULT;
> > +
> > +	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
> > +		return -EINVAL;
> > +	if (friar->hdr.pad != 0)
> > +		return -EINVAL;
> > +	if (friar->hdr.len != sizeof(*friar))
> > +		return -EINVAL;
> > +
> > +	return info_len;
> > +}
> > +
> 
> ...
> 
> > @@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (fd < 0)
> > +	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> >  		return -EINVAL;
> >  
> > -	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > +	if (response & FAN_INFO) {
> > +		ret = process_access_response_info(fd, info, info_len, &friar);
> > +		if (ret < 0)
> > +			return ret;
> > +	} else {
> > +		ret = 0;
> > +	}
> > +
> > +	if (fd < 0)
> >  		return -EINVAL;
> 
> And here I'd do:
> 
> 	if (fd == FAN_NOFD)
> 		return 0;
> 	if (fd < 0)
> 		return -EINVAL;
> 
> As we talked in previous revisions we'd specialcase FAN_NOFD to just verify
> extra info is understood by the kernel so that application writing fanotify
> responses has a way to check which information it can provide to the
> kernel.

The reason for including it in process_access_response_info() is to make
sure that it is included in the FAN_INFO case to detect this extension.
If it were included here

> 								Honza
> 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

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
https://listman.redhat.com/mailman/listinfo/linux-audit

