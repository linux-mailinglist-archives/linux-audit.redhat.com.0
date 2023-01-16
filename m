Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0766D052
	for <lists+linux-audit@lfdr.de>; Mon, 16 Jan 2023 21:42:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673901770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gXiC72sEGeSKk5zUrhOnp0c1YPaTSsnt1tnbikctkms=;
	b=X7AO73naRcnFLCRpCpa2YJO4DtkWpXbu8o2ZVdv0J0/S0CLJ2pWXdBcuZ9z9EmeWldw2XW
	X2tmaLJ68+aCh7USJ84VFwpKzg5MdKG7NYS7lPG9pfhGRx648zClvs5ncLH+dbVnmsx8c7
	lAa6vfDTmSLT6NJnDHgenAzd1gezoJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-tpTI1bY6OkOQ3cUQDdoJwQ-1; Mon, 16 Jan 2023 15:42:49 -0500
X-MC-Unique: tpTI1bY6OkOQ3cUQDdoJwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A2D3815F61;
	Mon, 16 Jan 2023 20:42:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7C440C6EC4;
	Mon, 16 Jan 2023 20:42:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9AC3119465B3;
	Mon, 16 Jan 2023 20:42:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E66D01946589 for <linux-audit@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 20:42:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D76A54015306; Mon, 16 Jan 2023 20:42:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62B9140C6EC4;
 Mon, 16 Jan 2023 20:42:31 +0000 (UTC)
Date: Mon, 16 Jan 2023 15:42:29 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <Y8W2tcXFoUajzojc@madcap2.tricolour.ca>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
 <Y6TCWe4/nR957pFh@madcap2.tricolour.ca>
 <20230103124201.iopasddbtb6vi362@quack3>
MIME-Version: 1.0
In-Reply-To: <20230103124201.iopasddbtb6vi362@quack3>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On 2023-01-03 13:42, Jan Kara wrote:
> On Thu 22-12-22 15:47:21, Richard Guy Briggs wrote:
> > On 2022-12-16 17:43, Jan Kara wrote:
> > > On Mon 12-12-22 09:06:10, Richard Guy Briggs wrote:
> > > > This patch adds a flag, FAN_INFO and an extensible buffer to provide
> > > > additional information about response decisions.  The buffer contains
> > > > one or more headers defining the information type and the length of the
> > > > following information.  The patch defines one additional information
> > > > type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
> > > > allow for the creation of other information types in the future if other
> > > > users of the API identify different needs.
> > > > 
> > > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > > Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
> > > > Suggested-by: Jan Kara <jack@suse.cz>
> > > > Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

> > > > +{
> > > > +	if (fd == FAN_NOFD)
> > > > +		return -ENOENT;
> > > 
> > > I would not test 'fd' in this function at all. After all it is not part of
> > > the response info structure and you do check it in
> > > process_access_response() anyway.
> > 
> > I wrestled with that.  I was even tempted to swallow the following fd
> > check too, but the flow would not have made as much sense for the
> > non-INFO case.
> > 
> > My understanding from Amir was that FAN_NOFD was only to be sent in in
> > conjuction with FAN_INFO to test if a newer kernel was present.
> 
> Yes, that is correct. But we not only want to check that FAN_INFO flag is
> understood (as you do in your patch) but also whether a particular response
> type is understood (which you don't verify for FAN_NOFD). Currently, there
> is only one response type (FAN_RESPONSE_INFO_AUDIT_RULE) but if there are
> more in the future we need old kernels to refuse new response types even
> for FAN_NOFD case.

Ok, I agree the NOFD check should be after.

> > I presumed that if FAN_NOFD was present without FAN_INFO that was an
> > invalid input to an old kernel.
> 
> Yes, that is correct and I agree the conditions I've suggested below are
> wrong in that regard and need a bit of tweaking. Thanks for catching it.
> 
> > > > +
> > > > +	if (info_len != sizeof(*friar))
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (copy_from_user(friar, info, sizeof(*friar)))
> > > > +		return -EFAULT;
> > > > +
> > > > +	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
> > > > +		return -EINVAL;
> > > > +	if (friar->hdr.pad != 0)
> > > > +		return -EINVAL;
> > > > +	if (friar->hdr.len != sizeof(*friar))
> > > > +		return -EINVAL;
> > > > +
> > > > +	return info_len;
> > > > +}
> > > > +
> > > 
> > > ...
> > > 
> > > > @@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
> > > >  		return -EINVAL;
> > > >  	}
> > > >  
> > > > -	if (fd < 0)
> > > > +	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > >  		return -EINVAL;
> > > >  
> > > > -	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > > +	if (response & FAN_INFO) {
> > > > +		ret = process_access_response_info(fd, info, info_len, &friar);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > > > +	} else {
> > > > +		ret = 0;
> > > > +	}
> > > > +
> > > > +	if (fd < 0)
> > > >  		return -EINVAL;
> > > 
> > > And here I'd do:
> > > 
> > > 	if (fd == FAN_NOFD)
> > > 		return 0;
> > > 	if (fd < 0)
> > > 		return -EINVAL;
> > > 
> > > As we talked in previous revisions we'd specialcase FAN_NOFD to just verify
> > > extra info is understood by the kernel so that application writing fanotify
> > > responses has a way to check which information it can provide to the
> > > kernel.
> > 
> > The reason for including it in process_access_response_info() is to make
> > sure that it is included in the FAN_INFO case to detect this extension.
> > If it were included here
> 
> I see what you're getting at now. So the condition
> 
>  	if (fd == FAN_NOFD)
>  		return 0;
> 
> needs to be moved into 
> 
> 	if (response & FAN_INFO)
> 
> branch after process_access_response_info(). I still prefer to keep it
> outside of the process_access_response_info() function itself as it looks
> more logical to me. Does it address your concerns?

Ok.  Note that this does not return zero to userspace, since this
function's return value is added to the size of the struct
fanotify_response when there is no error.

For that reason, I think it makes more sense to return -ENOENT, or some
other unused error code that fits, unless you think it is acceptable to
return sizeof(struct fanotify_response) when FAN_INFO is set to indicate
this.

> Jan Kara <jack@suse.com>

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

