Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE866E708
	for <lists+linux-audit@lfdr.de>; Tue, 17 Jan 2023 20:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673984042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+ITKdC0eiICqc/VPHX0hV0Rivt2cUgqNYZ2jE0fnLOw=;
	b=dzfHuIt53RWPxCwfiaXsKM6HBUHA5MtjVWqOatpJg1ZVShmbeT+G2zsufbVCHp6gxsXwON
	LWcqwYt5pporDf2Z0XYwwujduEAVGy/J1SP+8VLGzl1OKwN7RhUfSloBzWq2egV9h5YzbL
	tqTgROtdTJlcKHlYMhF20o0RyPZjzqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-TgGgDRfhMzGpRWG7yn0_EQ-1; Tue, 17 Jan 2023 14:34:00 -0500
X-MC-Unique: TgGgDRfhMzGpRWG7yn0_EQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A3818A0102;
	Tue, 17 Jan 2023 19:33:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF52514171BB;
	Tue, 17 Jan 2023 19:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A980B19466DF;
	Tue, 17 Jan 2023 19:33:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB33A19465A4 for <linux-audit@listman.corp.redhat.com>;
 Tue, 17 Jan 2023 19:33:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA3D340C2006; Tue, 17 Jan 2023 19:33:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF35640C2064;
 Tue, 17 Jan 2023 19:33:46 +0000 (UTC)
Date: Tue, 17 Jan 2023 14:33:44 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <Y8b4GHkrw2spVwUX@madcap2.tricolour.ca>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
 <Y6TCWe4/nR957pFh@madcap2.tricolour.ca>
 <20230103124201.iopasddbtb6vi362@quack3>
 <Y8W2tcXFoUajzojc@madcap2.tricolour.ca>
 <20230117082723.7g3ig6ernoslt7ub@quack3>
MIME-Version: 1.0
In-Reply-To: <20230117082723.7g3ig6ernoslt7ub@quack3>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-17 09:27, Jan Kara wrote:
> On Mon 16-01-23 15:42:29, Richard Guy Briggs wrote:
> > On 2023-01-03 13:42, Jan Kara wrote:
> > > On Thu 22-12-22 15:47:21, Richard Guy Briggs wrote:
> > > > > > +
> > > > > > +	if (info_len != sizeof(*friar))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	if (copy_from_user(friar, info, sizeof(*friar)))
> > > > > > +		return -EFAULT;
> > > > > > +
> > > > > > +	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
> > > > > > +		return -EINVAL;
> > > > > > +	if (friar->hdr.pad != 0)
> > > > > > +		return -EINVAL;
> > > > > > +	if (friar->hdr.len != sizeof(*friar))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	return info_len;
> > > > > > +}
> > > > > > +
> > > > > 
> > > > > ...
> > > > > 
> > > > > > @@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
> > > > > >  		return -EINVAL;
> > > > > >  	}
> > > > > >  
> > > > > > -	if (fd < 0)
> > > > > > +	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > > > >  		return -EINVAL;
> > > > > >  
> > > > > > -	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > > > > +	if (response & FAN_INFO) {
> > > > > > +		ret = process_access_response_info(fd, info, info_len, &friar);
> > > > > > +		if (ret < 0)
> > > > > > +			return ret;
> > > > > > +	} else {
> > > > > > +		ret = 0;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (fd < 0)
> > > > > >  		return -EINVAL;
> > > > > 
> > > > > And here I'd do:
> > > > > 
> > > > > 	if (fd == FAN_NOFD)
> > > > > 		return 0;
> > > > > 	if (fd < 0)
> > > > > 		return -EINVAL;
> > > > > 
> > > > > As we talked in previous revisions we'd specialcase FAN_NOFD to just verify
> > > > > extra info is understood by the kernel so that application writing fanotify
> > > > > responses has a way to check which information it can provide to the
> > > > > kernel.
> > > > 
> > > > The reason for including it in process_access_response_info() is to make
> > > > sure that it is included in the FAN_INFO case to detect this extension.
> > > > If it were included here
> > > 
> > > I see what you're getting at now. So the condition
> > > 
> > >  	if (fd == FAN_NOFD)
> > >  		return 0;
> > > 
> > > needs to be moved into 
> > > 
> > > 	if (response & FAN_INFO)
> > > 
> > > branch after process_access_response_info(). I still prefer to keep it
> > > outside of the process_access_response_info() function itself as it looks
> > > more logical to me. Does it address your concerns?
> > 
> > Ok.  Note that this does not return zero to userspace, since this
> > function's return value is added to the size of the struct
> > fanotify_response when there is no error.
> 
> Right, good point. 0 is not a good return value in this case.
> 
> > For that reason, I think it makes more sense to return -ENOENT, or some
> > other unused error code that fits, unless you think it is acceptable to
> > return sizeof(struct fanotify_response) when FAN_INFO is set to indicate
> > this.
> 
> Yeah, my intention was to indicate "success" to userspace so I'd like to
> return whatever we return for the case when struct fanotify_response is
> accepted for a normal file descriptor - looks like info_len is the right
> value. Thanks!

Ok, I hadn't thought of that.  So, to confirm, when FAN_INFO is set, if
FAN_NOFD is also set, return info_len from process_access_response() and
then immediately return sizeof(struct fanotify_response) plus info_len
to userspace without issuing an audit record should indicate support for
FAN_INFO and the specific info type supplied.

Thanks for helping work through this.

> 								Honza
> -- 
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

